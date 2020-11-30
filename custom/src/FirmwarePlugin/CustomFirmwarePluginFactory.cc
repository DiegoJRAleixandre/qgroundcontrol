/****************************************************************************
 *
 * (c) 2009-2019 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 * @file
 *   @brief Custom Firmware Plugin Factory (PX4)
 *   @author Gus Grubba <gus@auterion.com>
 *
 */

#include "CustomFirmwarePluginFactory.h"
#include "CustomFirmwarePlugin.h"

CustomFirmwarePluginFactory CustomFirmwarePluginFactoryImp;

CustomFirmwarePluginFactory::CustomFirmwarePluginFactory()
    : plugin(nullptr)
{
}

QList<MAV_AUTOPILOT> CustomFirmwarePluginFactory::supportedFirmwareTypes() const
{
    QList<MAV_AUTOPILOT> list;
    list.append(MAV_AUTOPILOT_ARDUPILOTMEGA);
    return list;
}

FirmwarePlugin* CustomFirmwarePluginFactory::firmwarePluginForAutopilot(MAV_AUTOPILOT firmwareType, MAV_TYPE vehicleType)
{
    Q_UNUSED(vehicleType);
    if (firmwareType == MAV_AUTOPILOT_ARDUPILOTMEGA) {
        if (!plugin) {
            plugin = new CustomFirmwarePlugin;
        }
        return plugin;
    }
    return nullptr;
}
