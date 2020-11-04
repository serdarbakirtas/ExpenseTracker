## Code Style
***

+ Files are divided into following folders:
    - Views -> main content, divided further views shown by application
    - Model -> simple object classes, mostly conforms to database objects
    - Viewmodels -> classes that represents shown data in ui, they are created from model objects 
+ Order of the files in views folder should be:
    - Table/Collection View Cell
    - View Controller
    - Presenter
+ Naming of files in views folder:
    - For table/collection cells: *Some*Cell
    - For view controllers: *Some*ViewController
    - For presenters: *Some*Presenter
+ Naming of functions:
    - Basic functions start with verbs (i.e. loadTransaction())
    - Actions/Listeners usually start with 'on' (i.e. onLoadTransaction())
+ '// MARK:' feature should be used to divide different portions of the code. The order should be like:
    - // MARK: Properties
        + static let
        + let/var
    - // MARK: Functions (other functions used in a class)
        + Always put private keyword if func is used only in that class
    - // MARK: API Calls (for presenters)
+ Unit Test:
    - For mock: *Some*Mock
    - For presenters: *Some*PresenterUnitTest
    - Foot note: use the (Given/When/Then) for naming