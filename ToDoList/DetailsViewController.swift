

//  DetailsViewController.swift
//  To-Do List App
//
/* Created and Developed by
 Manmeen Kaur - 301259638
 Neha Patel - 301280513
 Sarthak Vashistha - 301245284
 
 Date Created: 11/12/2022
 To-Do List App - Created To Do List App - Data Persistence
 Version: 1.2.0
 */
//
//
import CoreData
import UIKit

class DetailsViewController: UIViewController {

   
    
    @IBOutlet weak var TaskTitleField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var IsCompletedSwitch: UISwitch!
    @IBOutlet weak var HasDueDateSwitch: UISwitch!
    @IBOutlet weak var TaskNotesField: UITextView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    let contextApp = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Tasks Details"
        datePicker.isHidden = true
        HasDueDateSwitch.isOn = false
        IsCompletedSwitch.isOn = false
    }
    
    @IBAction func HasDueDateFun(_ sender: UISwitch) {
        if(sender.isOn){
            datePicker.isHidden = false
            IsCompletedSwitch.isOn = true
        }else{
            datePicker.isHidden = true
            IsCompletedSwitch.isOn = false
        }
    }
    
    func dataSaving(){
        do{
            try self.contextApp.save()
            let _ = try self.contextApp.fetch(NotesData.fetchRequest())
        }
        catch{
            print("Error")
        }
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        let toast = UIAlertController(title: "Alert", message: "Submit Data", preferredStyle: .alert)
        
        toast.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
        }))
        toast.addAction(UIAlertAction(title: "Submit", style: .default, handler: { action in
            let formatting = DateFormatter()
            formatting.dateFormat = "MMM d yyyy, h:mm a"
            
            let newData = NotesData(context: self.contextApp)
            
            newData.notes = self.TaskNotesField.text
            newData.name = self.TaskTitleField.text
            newData.id = Int32(truncating: 0 as NSNumber)
            newData.isCompleted = self.IsCompletedSwitch.isOn
            newData.hasDueDate = self.HasDueDateSwitch.isOn
            
            if(self.HasDueDateSwitch.isOn){
                formatting.string(from: self.datePicker.date)
                newData.date = self.datePicker.date
            }
            self.dataSaving()
            _ = self.navigationController?.popToRootViewController(animated: true)
            
        }))
        present(toast, animated: true)
        
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        TaskTitleField.text = ""
        datePicker.isHidden = true
        IsCompletedSwitch.isOn = false
        HasDueDateSwitch.isOn = false
        TaskNotesField.text = ""
    }
}
