import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.12
import QtCharts 2.0

Window {
    width: 1600
    height: 1100
    visible: true
    minimumHeight: 900
    minimumWidth: 1200
    title: qsTr("La Banque")


    function getRandomInt(min, max) {
      min = Math.ceil(min);
      max = Math.floor(max);
      return Math.floor(Math.random() * (max - min +1)) + min;
    }

    // Background Color
    property Gradient bckColor: Gradient{
        GradientStop{position:0.3; color: "#0093E9" }
        GradientStop{position:1.0; color: "#80D0C7" }
    }

    Rectangle{
        id:container
        anchors.fill:parent
        color:"#0093b9"
        gradient: bckColor


    Row{
        id:navBar
        width:parent.width
        height:parent.height/14
        anchors{top: parent.top;left: parent.left;topMargin: 5;leftMargin: 5}
        spacing:5

        Rectangle{
            id:rect1
            width: 1/8* parent.width
            height: parent.height
            radius: 40

            Text {
                id: text1
                anchors{centerIn:parent}
                text: ("Bancaire")
                font.bold: true
                font.pointSize: 15
                color: "#0093E9"
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: if(hoverEnabled == true){ if(containsMouse == true) {text1.color= "black";text1.font.pointSize=17} else {text1.color="#0093E9";text1.font.pointSize=15}}
            }
        }

            Rectangle{
                id:rect2
                width: 1/8*navBar.width
                height: parent.height
                radius: 40

                Text {
                    id: text2
                    anchors{centerIn:parent}
                    text: qsTr("Assurance")
                    font.bold: true
                    font.pointSize: 15
                    color: "#0093E9"
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: if(hoverEnabled == true){ if(containsMouse == true) {text2.color= "black";text2.font.pointSize=17} else {text2.color="#0093E9";text2.font.pointSize=15}}
                }
            }

            Rectangle{
                width: 1/8* navBar.width
                height: parent.height
                radius: 40

                Text {
                    id: text3
                    anchors{centerIn:parent}
                    text: qsTr("Boursier")
                    font.bold: true
                    font.pointSize: 15
                    color: "#0093E9"
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: if(hoverEnabled == true){ if(containsMouse == true) {text3.color= "black";text3.font.pointSize=17} else {text3.color="#0093E9";text3.font.pointSize=15}}
                }
            }
    }

    Switch{
        id:swicth
        anchors{right: parent.right;top: parent.top;topMargin: 10}
        text: "Dark Mode"
        font.bold: true
        checked: false

        onCheckedChanged: {
                if(checked == true)
                {
                    container.gradient = "transparent"
                    container.color="#2C3E50"
                }else{
                    container.gradient=bckColor
                    }
        }
    }


   Row{
        id: rowid
        anchors{top:navBar.bottom;topMargin: 20}
        height: 0.6*parent.height
        width: parent.width


    ChartView {
        title: "Bancaire"
        height: parent.height
        width: 1/3*parent.width
        theme: ChartView.ChartThemeBlueIcy
        antialiasing: true
        backgroundRoundness: 30


            BarSeries {
                id: mySeries
                barWidth:0.8
                axisX: BarCategoryAxis { categories: ["pret", "comptes", "chequiers","reste" ] }
                axisY: ValueAxis{min:0; max:100}
                BarSet {id:banc1; label: "Agence 1"; values: [23,12, 39, 70] }
                BarSet {id:banc2; label: "Agence 2"; values: [5, 1, 4, 2] }
                BarSet {id:banc3; label: "Agence 3"; values: [0,0,0,0] }
                BarSet {id:banc4; label: "Agence 4"; values: [0,0,0,0] }
                BarSet {id:banc5; label: "Agence 5"; values: [0,0,0,0]}            }
    }

        ChartView {
            title: "Assurances"
            id: area
            height: parent.height
            width: 1/3*parent.width
            theme: ChartView.ChartThemeBlueIcy
            antialiasing: true
            backgroundRoundness: 30


                StackedBarSeries {
                    id: assurances
                    axisX: BarCategoryAxis {categories: ["Velo", "Voiture", "Vacances","Autres" ] }
                    axisY: ValueAxis{min:0; max:100}
                    BarSet {id:assu1; label: "Agence 1"; values: [20,12,8,15] }
                    BarSet {id:assu2; label: "Agence 2"; values: [14,15,3,7]}
                    BarSet {id:assu3; label: "Agence 3"; values: [0,0,0,0] }
                    BarSet {id:assu4; label: "Agence 4"; values: [0,0,0,0] }
                    BarSet {id:assu5; label: "Agence 5"; values: [0,0,0,0] }
                }
        }


        ChartView {
            title: "Boursier"
            id: stackedBar
            height: parent.height
            width: 1/3*parent.width
            legend.alignment: Qt.AlignBottom
            theme: ChartView.ChartThemeBlueIcy
            backgroundRoundness: 30

            PieSeries {
                id: pieSeries
                PieSlice {id:bou1; label: "Agence 1"; value: 35 }
                PieSlice {id:bou2; label: "Agence 2"; value: 10 }
                PieSlice {id:bou3; label: "Agence 3"; value: 0 }
                PieSlice {id:bou4; label: "Agence 4"; value: 0 }
                PieSlice {id:bou5; label: "Agence 5"; value: 0 }
            }
        }

   }


    Rectangle{
            id:agences
            height: container.height*0.25
            width: container.width*0.12
            anchors{bottom: container.bottom;bottomMargin: 5;leftMargin: 5;left: container.left}
            radius:40

            Text {
                id:textAgences
                text:("Agences")
                anchors.horizontalCenter: parent.horizontalCenter
                topPadding: 3
                font.pointSize: 12
                font.bold: true
            }

                Column{

                    anchors{horizontalCenter:parent.horizontalCenter;topMargin: 10;top:textAgences.bottom  }

                    CheckBox{
                        id:agence1
                        text: ("Agence 1")
                        checked:true
                        onCheckedChanged: if(checked == true){for(var i=0;i<4;i++){banc1.replace(i,getRandomInt(0,100));assu1.replace(i,getRandomInt(0,20))};bou1.value=getRandomInt(0,100)}else{banc1.values=[0,0,0,0];assu1.values=[0,0,0,0];bou1.value=0}
                    }

                    CheckBox{
                        id:agence2
                        text: ("Agence 2")
                        checked:true
                        onCheckedChanged: if(checked == true){for(var i=0;i<4;i++){banc2.replace(i,getRandomInt(0,100));assu2.replace(i,getRandomInt(0,20))};bou2.value=getRandomInt(0,100)}else{banc2.values=[0,0,0,0];assu2.values=[0,0,0,0];bou2.value=0}
                    }

                    CheckBox{
                        id:agence3
                        text: ("Agence 3")
                        onCheckedChanged: if(checked == true){for(var i=0;i<4;i++){banc3.replace(i,getRandomInt(0,100));assu3.replace(i,getRandomInt(0,20))};bou3.value=getRandomInt(0,100)}else{banc3.values=[0,0,0,0];assu3.values=[0,0,0,0];bou3.value=0}

                    }

                    CheckBox{
                        id:agence4
                        text: ("Agence 4")
                        onCheckedChanged: if(checked == true){for(var i=0;i<4;i++){banc4.replace(i,getRandomInt(0,100));assu4.replace(i,getRandomInt(0,20))};bou4.value=getRandomInt(0,100)}else{banc4.values=[0,0,0,0];assu4.values=[0,0,0,0];bou4.value=0}
                    }

                    CheckBox{
                        id:agence5
                        text: ("Agence 5")
                        onCheckedChanged: if(checked == true){for(var i=0;i<4;i++){banc5.replace(i,getRandomInt(0,100));assu5.replace(i,getRandomInt(0,20))};bou5.value=getRandomInt(0,100)}else{banc5.values=[0,0,0,0];assu5.values=[0,0,0,0];bou5.value=0}
                    }

                }
    }

    Column{
        anchors{left: agences.right; leftMargin: 100;bottom: container.bottom;bottomMargin: 200}
        width: 300

        Text {
            text: ("Date")
            font.weight: Font.DemiBold
            font.pointSize: 18
            anchors.horizontalCenter: parent.horizontalCenter
        }

         ComboBox {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            model: [ "Janvier", "Fevrier", "Mars","Avril", "Mai", "June", "Juillet", "Aout", "Septembre", "Octobre","Novembre","Decembre" ]
         }
    }

}


}

