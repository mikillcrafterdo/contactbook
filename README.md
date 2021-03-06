# Contact Book

## Tech. description
Contact Book app is a C++/Qt/QML test app 

## Specifications:

- Qt 5.12
- qmake building system
- Tested on Linux Ubuntu 18.04

## Features:

### Load from file:
Contact Book application allow to open text files, parse data and load contacts from selected text file in the main dialogue.

When file is being loaded user can break process and use only already loaded contacts.

### Remove and Insert
User can remove chosen contact or insert a new one into any position (after/before) of a clicked existed contact or at
end of list. 

### Edit
User can edit any contact. Validation is presented (name and surename cannot contain spaces, email and birthday checked by mask). Date can be selected from date picker popup.

### Safe to file:
User can fill previously loaded file and save it. 

## Additional features
removing invalid rows during text file load
e-mail validation

## Format

### Contact fields:
- First name
- Last name
- Birthday
- Email

### Text file data
```
 name1 surname1 bd1 e-mail1 \n
 name2 surname2 bd2 e-mail2 \n
 name3 surname3 bd3 e-mail3 \n
```
## App sreenshots

1. text file - contacts daws family

![text file - contacts daws family](https://github.com/alexoveli/contactbook/blob/master/app%20screenshots/text%20file%20-%20contacts%20daws%20family.txt.png)

2. contactbook app - output from file - contacts daws family

![contactbook app - output from file - contacts daws family](https://github.com/alexoveli/contactbook/blob/master/app%20screenshots/contactbook%20app%20-%20output%20from%20file%20-%20contacts%20daws%20family.txt.png)

3. contactbook app - context menu

![contactbook app - context menu](https://github.com/alexoveli/contactbook/blob/master/app%20screenshots/contactbook%20app%20-%20context%20menu.png)

4. contactbook app - edit window

![contactbook app - edit window](https://github.com/alexoveli/contactbook/blob/master/app%20screenshots/contactbook%20app%20-%20edit%20window.png)

5. contactbook app - edit window - select date

![contactbook app - edit window - select date](https://github.com/alexoveli/contactbook/blob/master/app%20screenshots/contactbook%20app%20-%20edit%20window%20-%20select%20date.png)

6. contactbook app - loading file

![contactbook app - loading file](https://github.com/alexoveli/contactbook/blob/master/app%20screenshots/contactbook%20app%20-%20loading%20file.png)
