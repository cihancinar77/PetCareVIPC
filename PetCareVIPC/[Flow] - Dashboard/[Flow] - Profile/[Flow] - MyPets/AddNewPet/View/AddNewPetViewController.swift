//
//  AddNewPetViewController.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 15.07.2023.
//

import UIKit

protocol AddNewPetViewControllerProtocol: AnyObject {
    func display(viewState: AddNewPetViewState)
    func displayPickedImage(pickedImage: UIImage)
    func displaySpecies(species: String)
    func displayBreed(breed: String)
    func displaySize(size: String)
    func displayDob(dob: String)
    func displayPickerView(type: PickerViewType, title: String)
}

final class AddNewPetViewController: UIViewController {
    
    // MARK: - Private Variables
    private var animalSpecies = ActionSheetModel.species.actionSheetModel
    private var breedArray: [String] = []
    private var sizesArray = ActionSheetModel.size.actionSheetModel
    private var collectionViewData: [CellType] = [CellType.addEvent, CellType.reminder(icon: UIImage(named: "vaccineIcon")!, title: "Measles vaccine", date: "30.08.2023"), CellType.reminder(icon: UIImage(named: "vaccineIcon")!, title: "Rabies vaccine", date: "12.09.2023")]
    
    private let interactor: AddNewPetInteractorProtocol
    init(interactor: AddNewPetInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let customView = AddNewPetView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
        customView.petsNameTextField.delegate = self
        prepareNavigationBar()
        prepareViewGestures()
        interactor.viewDidLoad()
    }
   
    // MARK: - Private Functions
    private func displayPickerView(type: PickerViewType, title: String, selectedRow: @escaping (Int) -> Void) {
        let screenWidth = UIScreen.main.bounds.width - 10
        let screenHeight = 240.0
        
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        
        let picker = UIPickerView(frame: .init(x: 0, y: 0, width: screenWidth, height: screenHeight))
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.tag = type.rawValue
        picker.dataSource = self
        vc.view.addSubview(picker)
        
        NSLayoutConstraint.activate([
            picker.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor, constant: 16),
            picker.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor, constant: -16)
        ])
        
        let pickerSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        pickerSheet.setValue(vc, forKey: "contentViewController")
        pickerSheet.title = title
        pickerSheet.addAction(UIAlertAction(title: "Done", style: .cancel, handler: { action in
            selectedRow(picker.selectedRow(inComponent: 0))
        }))
        present(pickerSheet, animated: true, completion: nil)
    }
    
    @objc private func didTapSaveButton() {
        interactor.didTapSaveButton()
    }
    
    @objc private func didTapAddImageButton() {
        showImagePicker()
    }
    
    @objc private func speciesStackViewTapped() {
        interactor.didTapPickerSelection(type: .species)
    }
    
    @objc private func breedStackViewTapped() {
        interactor.didTapPickerSelection(type: .breed)
    }
    
    @objc private func sizeStackViewTapped() {
        interactor.didTapPickerSelection(type: .size)
    }
    
    @objc private func didGenderSegmentValueChanged() {
        let index = customView.genderSegmentedControl.selectedSegmentIndex
        interactor.didTapGenderSelect(selectedGender: index)
    }
    
    @objc private func dobStackViewTapped() {
        let screenWidth = UIScreen.main.bounds.width - 10
        let screenHeight = 240.0
        
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        vc.view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor, constant: 16),
            datePicker.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor, constant: -16)
        ])
        
        let pickerSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        pickerSheet.setValue(vc, forKey: "contentViewController")
        pickerSheet.title = title
        pickerSheet.addAction(UIAlertAction(title: "Done", style: .cancel, handler: { action in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yy-MM-dd"
            self.interactor.didTapDobSelect(selectedDate: dateFormatter.string(from: datePicker.date))
        }))
        present(pickerSheet, animated: true, completion: nil)
    }
    
    @objc private func didToggleSwitch(_ sender: UISwitch) {
        guard let switchType = AddPetSwitchType(rawValue: sender.tag) else { return }
        interactor.didToggleSwitch(switchType: switchType)
    }
    
    private func prepareViewGestures() {
        customView.actionButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        customView.petImageAddButton.addTarget(self, action: #selector(didTapAddImageButton), for: .touchUpInside)
        let speciesTapGesture = UITapGestureRecognizer(target: self, action: #selector(speciesStackViewTapped))
        customView.speciesTextfieldStackView.addGestureRecognizer(speciesTapGesture)
        let breedTapGesture = UITapGestureRecognizer(target: self, action: #selector(breedStackViewTapped))
        customView.breedTextfieldStackView.addGestureRecognizer(breedTapGesture)
        let sizeTapGesture = UITapGestureRecognizer(target: self, action: #selector(sizeStackViewTapped))
        customView.sizeTextfieldStackView.addGestureRecognizer(sizeTapGesture)
        customView.genderSegmentedControl.addTarget(self, action: #selector(didGenderSegmentValueChanged), for: .valueChanged)
        interactor.viewDidLoad()
        let dobTapGesture = UITapGestureRecognizer(target: self, action: #selector(dobStackViewTapped))
        customView.dobTextfieldStackView.addGestureRecognizer(dobTapGesture)
    }
    
    private func prepareNavigationBar() {
        self.title = "Add pet detail"
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let editButton = UIButton(type: .system)
        editButton.setTitleColor(Colors.violet, for: .normal)
        editButton.setTitle("Save", for: .normal)
        editButton.sizeToFit()
        editButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        let editBarButtonItem = UIBarButtonItem(customView: editButton)
        navigationItem.rightBarButtonItem = editBarButtonItem
    }
}

// MARK: - AddNewPetViewControllerProtocol
extension AddNewPetViewController: AddNewPetViewControllerProtocol {
    
    func display(viewState: AddNewPetViewState) {
        switch viewState {
        case .initial:
            break
        case .error(let alertViewModel):
            let alertController = UIAlertController(title: alertViewModel.title, message: alertViewModel.message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: alertViewModel.buttonTitle, style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func displayPickerView(type: PickerViewType, title: String) {
        displayPickerView(type: type, title: title) { row in
            switch type {
            case .species:
                self.interactor.didTapSpeciesSelect(selectedRow: row)
                let species = ActionSheetModel.species.actionSheetModel[row]
                if let selected = AnimalSpecies(rawValue: species) {
                    self.breedArray = selected.animalSpecies
                }
            case .breed:
                self.interactor.didTapBreedSelect(selectedRow: row)
            case .size:
                self.interactor.didTapSizeSelect(selectedRow: row)
            }
        }
    }
    
    func displayPickedImage(pickedImage: UIImage) {
        customView.petImageView.image = pickedImage
    }
    
    func displaySpecies(species: String) {
        customView.speciesTextField.text = species
        customView.breedTextField.text = ""
    }
    
    func displayBreed(breed: String) {
        customView.breedTextField.text = breed
    }
    
    func displaySize(size: String) {
        customView.sizeTextField.text = size
    }
    
    func displayDob(dob: String) {
        customView.dobTextField.text = dob
    }
}

// MARK: - UIImagePickerControllerDelegate
extension AddNewPetViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            interactor.didPickImage(pickedImage: pickedImage)
        }
    }
}

// MARK: - UITextViewDelegate
extension AddNewPetViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) {
            interactor.didNamingFinish(name: updatedText)
        }
        return true
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension AddNewPetViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 0) {
            return animalSpecies.count
        } else if (pickerView.tag == 1) {
            return breedArray.count
        } else if (pickerView.tag == 2) {
            return sizesArray.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 0) {
            return animalSpecies[row]
        } else if (pickerView.tag == 1) {
            return breedArray[row]
        } else if (pickerView.tag == 2) {
            return sizesArray[row]
        }
        return ""
    }
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource
extension AddNewPetViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionViewData[indexPath.row] {
        case .addEvent:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddEventCollectionViewCell", for: indexPath) as! AddEventCollectionViewCell
            cell.reloadWith()
            return cell
        case .reminder(let icon, let title, let date):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReminderCollectionViewCell", for: indexPath) as! ReminderCollectionViewCell
            cell.reloadWith(icon: icon, title: title, date: date)
            return cell
        }
    }
}
