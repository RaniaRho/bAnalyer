UI_Path=Resources/UI

clear

echo -e "\e[1;37mGenerating UIs..."
echo -e "\e[1;31m   Generating MainUI"
pyuic4 -o $UI_Path/Analyzer.py $UI_Path/Analyzer.ui

echo -e "\e[1;37m\nStarting Braingizer-Analyzer\n\e[0m"
python DetectorGUI.py
