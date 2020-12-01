/****************************************************************************
 *
 * (c) 2009-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick                  2.11
import QtQuick.Controls         2.4
import QtQuick.Dialogs          1.3
import QtQuick.Layouts          1.11

import QtLocation               5.3
import QtPositioning            5.3
import QtQuick.Window           2.2
import QtQml.Models             2.1

import QGroundControl               1.0
import QGroundControl.Airspace      1.0
import QGroundControl.Controllers   1.0
import QGroundControl.Controls      1.0
import QGroundControl.FactSystem    1.0
import QGroundControl.FlightDisplay 1.0
import QGroundControl.FlightMap     1.0
import QGroundControl.Palette       1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Vehicle       1.0

Item {

    property bool popupOpened:      controlsPopup.opened
    property bool preflightChecked: true
    property bool inflightChecked:  false

    Rectangle {
        id:             telemetryRectangle
        anchors.right:  parent.right
        anchors.bottom: parent.bottom
        anchors.margins:_toolsMargin
        height:         ScreenTools.defaultFontPixelWidth * 20
        width:          ScreenTools.defaultFontPixelWidth * 40
        color:          qgcPal.window
        radius:         10

        Rectangle {
                id:                       tittleTelemetryGround
                anchors.top:              parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                height:                   ScreenTools.defaultFontPixelHeight
                width:                    ScreenTools.defaultFontPixelWidth * 6
                radius:                   10
                color:                    qgcPal.window
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   "Ground Unit Status"
                }
            }


        GridLayout {
            anchors.bottom:         parent.bottom
            anchors.right:          parent.right
            anchors.left:           parent.left
            anchors.top:            tittleTelemetryGround.bottom
            
            anchors.topMargin:      ScreenTools.defaultFontPixelWidth * 0.5
            anchors.bottomMargin:   ScreenTools.defaultFontPixelWidth * 0.5
            anchors.leftMargin:     ScreenTools.defaultFontPixelWidth
            anchors.rightMargin:    ScreenTools.defaultFontPixelWidth

            columnSpacing:          ScreenTools.defaultFontPixelWidth * 0.5
            rowSpacing:             ScreenTools.defaultFontPixelWidth * 0.5
            columns:                4
            rows:                   7
            flow:                   GridLayout.LeftToRight
            visible:                true

            QGCLabel {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      3
        
                font.pointSize:         ScreenTools.smallFontPointSize
                text:                   "Sbd Quality: "
                elide:                  Text.ElideRight
            }
        
            Rectangle {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      1
        
                width:                  ScreenTools.defaultFontPixelWidth * 6
                radius:                 10
                color:                  qgcPal.windowShade
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   QGroundControl.telemetryGroundUnit.sbdQuality
                }
            }

            QGCLabel {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      3
        
                font.pointSize:         ScreenTools.smallFontPointSize
                text:                   "Sms Quality 1: "
                elide:                  Text.ElideRight
            }
        
            Rectangle {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      1
        
                width:                  ScreenTools.defaultFontPixelWidth * 6
                radius:                 10
                color:                  qgcPal.windowShade
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   QGroundControl.telemetryGroundUnit.smsQuality1
                }
            }

            QGCLabel {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      3
        
                font.pointSize:         ScreenTools.smallFontPointSize
                text:                   "Sms Quality 2: "
                elide:                  Text.ElideRight
            }
        
            Rectangle {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      1
        
                width:                  ScreenTools.defaultFontPixelWidth * 6
                radius:                 10
                color:                  qgcPal.windowShade
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   QGroundControl.telemetryGroundUnit.smsQuality2
                }
            }

            QGCLabel {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      3
        
                font.pointSize:         ScreenTools.smallFontPointSize
                text:                   "Sms Quality 3: "
                elide:                  Text.ElideRight
            }
        
            Rectangle {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      1
        
                width:                  ScreenTools.defaultFontPixelWidth * 6
                radius:                 10
                color:                  qgcPal.windowShade
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   QGroundControl.telemetryGroundUnit.smsQuality3
                }
            }

            QGCLabel {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      1
        
                font.pointSize:         ScreenTools.smallFontPointSize
                text:                   "UnderVoltage: " 
                elide:                  Text.ElideRight

                visible:                (QGroundControl.telemetryGroundUnit.ocurredLowVolt || QGroundControl.telemetryGroundUnit.lowVolt)
            }
        
            Rectangle {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      3
        
                width:                  ScreenTools.defaultFontPixelWidth * 6
                radius:                 10
                color:                  QGroundControl.telemetryGroundUnit.lowVolt ? "darkred" : "darkgoldenrod"

                visible:                (QGroundControl.telemetryGroundUnit.ocurredLowVolt || QGroundControl.telemetryGroundUnit.lowVolt)
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   QGroundControl.telemetryGroundUnit.lowVolt ? "Low Voltage happening now" : "Low Voltage has ocurred"
                }
            }

            QGCLabel {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      1
        
                font.pointSize:         ScreenTools.smallFontPointSize
                text:                   "Throttling: " 
                elide:                  Text.ElideRight

                visible:                (QGroundControl.telemetryGroundUnit.ocurredThrottled || QGroundControl.telemetryGroundUnit.currentlyThrottled)
            }
        
            Rectangle {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      3
        
                width:                  ScreenTools.defaultFontPixelWidth * 6
                radius:                 10
                color:                  QGroundControl.telemetryGroundUnit.currentlyThrottled ? "darkred" : "darkgoldenrod"

                visible:                (QGroundControl.telemetryGroundUnit.ocurredThrottled || QGroundControl.telemetryGroundUnit.currentlyThrottled)
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   QGroundControl.telemetryGroundUnit.currentlyThrottled ? "Throttling happening now" : "Throttling has ocurred"                 
                }
            }
        }
    }

    Rectangle {
        id:             telemetryRectangleAir
        anchors.right:  telemetryRectangle.left
        anchors.bottom: parent.bottom
        anchors.margins:_toolsMargin
        height:         ScreenTools.defaultFontPixelWidth * 20
        width:          ScreenTools.defaultFontPixelWidth * 40
        color:          qgcPal.window
        radius:         10

        Rectangle {
                id:                       tittleTelemetryAir
                anchors.top:              parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                height:                   ScreenTools.defaultFontPixelHeight
                width:                    ScreenTools.defaultFontPixelWidth * 6
                radius:                   10
                color:                    qgcPal.window
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   "Air Unit Status (Active Vehicle)"
                }
            }


        GridLayout {
            anchors.bottom:         parent.bottom
            anchors.right:          parent.right
            anchors.left:           parent.left
            anchors.top:            tittleTelemetryAir.bottom
            
            anchors.topMargin:      ScreenTools.defaultFontPixelWidth * 0.5
            anchors.bottomMargin:   ScreenTools.defaultFontPixelWidth * 0.5
            anchors.leftMargin:     ScreenTools.defaultFontPixelWidth
            anchors.rightMargin:    ScreenTools.defaultFontPixelWidth

            columnSpacing:          ScreenTools.defaultFontPixelWidth * 0.5
            rowSpacing:             ScreenTools.defaultFontPixelWidth * 0.5
            columns:                4
            rows:                   7
            flow:                   GridLayout.LeftToRight
            visible:                true

            QGCLabel {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      3
        
                font.pointSize:         ScreenTools.smallFontPointSize
                text:                   "Active Link: "
                elide:                  Text.ElideRight
            }
        
            Rectangle {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      1
        
                width:                  ScreenTools.defaultFontPixelWidth * 6
                radius:                 10
                color:                  qgcPal.windowShade
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   ( activeVehicle.activeLinkAM == 0 ) ? "WIFI" :
                                            ( activeVehicle.activeLinkAM == 1 ) ? "RFD" :
                                            ( activeVehicle.activeLinkAM == 2 ) ? "GSM" :
                                            ( activeVehicle.activeLinkAM == 3 ) ? "SBD" :
                                            "UNKNOWN"
                }
            }

            QGCLabel {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      3
        
                font.pointSize:         ScreenTools.smallFontPointSize
                text:                   "Sbd Quality: "
                elide:                  Text.ElideRight
            }
        
            Rectangle {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      1
        
                width:                  ScreenTools.defaultFontPixelWidth * 6
                radius:                 10
                color:                  qgcPal.windowShade
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   activeVehicle.sbdQuality
                }
            }

            QGCLabel {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      3
        
                font.pointSize:         ScreenTools.smallFontPointSize
                text:                   "Sms Quality 1: "
                elide:                  Text.ElideRight
            }
        
            Rectangle {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      1
        
                width:                  ScreenTools.defaultFontPixelWidth * 6
                radius:                 10
                color:                  qgcPal.windowShade
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   activeVehicle.smsQuality1
                }
            }

            QGCLabel {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      3
        
                font.pointSize:         ScreenTools.smallFontPointSize
                text:                   "Sms Quality 2: "
                elide:                  Text.ElideRight
            }
        
            Rectangle {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      1
        
                width:                  ScreenTools.defaultFontPixelWidth * 6
                radius:                 10
                color:                  qgcPal.windowShade
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   activeVehicle.smsQuality2
                }
            }

            QGCLabel {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      3
        
                font.pointSize:         ScreenTools.smallFontPointSize
                text:                   "Sms Quality 3: "
                elide:                  Text.ElideRight
            }
        
            Rectangle {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      1
        
                width:                  ScreenTools.defaultFontPixelWidth * 6
                radius:                 10
                color:                  qgcPal.windowShade
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   activeVehicle.smsQuality3
                }
            }

            QGCLabel {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      1
        
                font.pointSize:         ScreenTools.smallFontPointSize
                text:                   "UnderVoltage: " 
                elide:                  Text.ElideRight

                visible:                (activeVehicle.ocurredLowVolt || activeVehicle.lowVolt)
            }
        
            Rectangle {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      3
        
                width:                  ScreenTools.defaultFontPixelWidth * 6
                radius:                 10
                color:                  activeVehicle.lowVolt ? "darkred" : "darkgoldenrod"

                visible:                (activeVehicle.ocurredLowVolt || activeVehicle.lowVolt)
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   activeVehicle.lowVolt ? "Low Voltage happening now" : "Low Voltage has ocurred"
                }
            }

            QGCLabel {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      1
        
                font.pointSize:         ScreenTools.smallFontPointSize
                text:                   "Throttling: " 
                elide:                  Text.ElideRight

                visible:                (activeVehicle.ocurredThrottled || activeVehicle.currentlyThrottled)
            }
        
            Rectangle {
                Layout.fillWidth:       true
                Layout.fillHeight:      true
                Layout.columnSpan:      3
        
                width:                  ScreenTools.defaultFontPixelWidth * 6
                radius:                 10
                color:                  activeVehicle.currentlyThrottled ? "darkred" : "darkgoldenrod"

                visible:                (activeVehicle.ocurredThrottled || activeVehicle.currentlyThrottled)
        
                QGCLabel {
                    anchors.fill:           parent
                    horizontalAlignment:    Text.AlignHCenter           
                    verticalAlignment:      Text.AlignVCenter

                    font.pointSize:         ScreenTools.smallFontPointSize
                    text:                   activeVehicle.currentlyThrottled ? "Throttling happening now" : "Throttling has ocurred"                 
                }
            }
        }
    }

    Rectangle {
        id: controlsButtonRectangle

        anchors.right:      telemetryRectangle.right
        anchors.bottom:     telemetryRectangle.top
        anchors.bottomMargin:_toolsMargin

        height: controlsButtonImage.height + (_margins * 4)
        width:  controlsButtonLabel.width + controlsButtonImage.width + (_margins * 3)
        color:  qgcPal.window
        radius: 10

        border.color:   qgcPal.text
        border.width:   1

        visible: !popupOpened

        QGCLabel {
            id: controlsButtonLabel

            anchors.right:          parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins:        _margins

            text: qsTr("Controls")
            font.pointSize: ScreenTools.mediumFontPointSize
        }

        QGCColoredImage {
            id: controlsButtonImage

            anchors.verticalCenter: parent.verticalCenter
            anchors.left:           parent.left
            anchors.margins:        _margins

            width:                  controlsButtonLabel.width * 0.3
            height:                 width
            sourceSize.height:      width
            source:                 "/custom/img/doubleArrows.svg"
            color:                  qgcPal.text

            transformOrigin:    Item.Center
            rotation:           225
        }

        MouseArea {
            anchors.fill:   parent
            hoverEnabled:   true
            onClicked:      !popupOpened ? controlsPopup.open() : undefined
        }
    }

    Item {
        id: popupContainer

        anchors.right:      telemetryRectangle.right
        anchors.bottom:     telemetryRectangle.top
        anchors.bottomMargin:_toolsMargin

        height: ScreenTools.defaultFontPixelWidth * 20
        width:  ScreenTools.defaultFontPixelWidth * 40

        Popup {
            id: controlsPopup

            anchors.centerIn:   parent
            width:              parent.width
            height:             parent.height

            background: Rectangle  {
                anchors.fill:           parent
                color:                  qgcPal.window
                radius:                 10
            }

            Item {
                anchors.bottom: parent.bottom
                anchors.right:  parent.right

                height: hideControlsImage.height
                width:  hideControlsImage.width

                QGCColoredImage {
                    id: hideControlsImage

                    anchors.centerIn:   parent

                    width:                  ScreenTools.defaultFontPixelWidth * 2
                    height:                 width
                    sourceSize.height:      width
                    source:                 "/custom/img/doubleArrows.svg"
                    color:                  qgcPal.text

                    transformOrigin:    Item.Center
                    rotation:           45
                }

                MouseArea {
                    anchors.fill:   parent
                    hoverEnabled:   true
                    onClicked:      controlsPopup.close()
                }
            }

            Item {
                anchors.top:    parent.top
                anchors.left:   parent.left
                anchors.right:  parent.right

                height: ScreenTools.defaultFontPixelHeight * 0.8

                RowLayout {
                    anchors.fill:   parent

                    Rectangle {
                        color:              qgcPal.windowShade
                        opacity:            preflightChecked ? 1 : 0.5
                        Layout.alignment:   Qt.AlignHCenter
                        Layout.fillHeight:  true
                        Layout.fillWidth:   true
                        radius:             5

                        QGCLabel {
                            anchors.centerIn: parent

                            text:           qsTr("Pre-Flight")
                            font.pointSize: ScreenTools.smallFontPointSize
                        }

                        MouseArea {
                            anchors.fill:   parent
                            hoverEnabled:   true
                            onClicked:      (preflightChecked = true) && (inflightChecked = false)
                        }
                    }

                    Rectangle {
                        Layout.alignment:   Qt.AlignHCenter
                        width:              1
                        height:             parent.height * 0.8
                    }

                    Rectangle {
                        color:              qgcPal.windowShade
                        opacity:            inflightChecked ? 1 : 0.5
                        Layout.alignment:   Qt.AlignHCenter
                        Layout.fillHeight:  true
                        Layout.fillWidth:   true
                        radius:             5

                        QGCLabel {
                            anchors.centerIn: parent

                            text:           qsTr("In-Flight")
                            font.pointSize: ScreenTools.smallFontPointSize
                        }

                        MouseArea {
                            anchors.fill:   parent
                            hoverEnabled:   true
                            onClicked:      (inflightChecked = true) && (preflightChecked = false)
                        }
                    }
                }
            }
        }
    }
}
