import sys
sys.path.append('Resources/Classes')
sys.path.append('Resources/python_emotiv')
sys.path.append('Resources/UI')


from PyQt4 import QtCore, QtGui
from Analyzer_extended import Ui_MainWindow_Extended


if __name__ == "__main__":
    import sys
    app = QtGui.QApplication(sys.argv)

    #MainUI
    MainWindow = QtGui.QMainWindow()
    ui_main = Ui_MainWindow_Extended()
    ui_main.setupUi(MainWindow)
    ui_main.InitializeUI()
    
    MainWindow.show()

    sys.exit(app.exec_())
