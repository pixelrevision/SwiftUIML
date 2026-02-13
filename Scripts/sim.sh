#!/usr/bin/env bash
#
# SwiftUIML Simulator Manager
# Creates or finds iOS simulators for snapshot testing
#
# Usage: ./Scripts/sim.sh <sim-name> <device-type> <runtime>
# Example: ./Scripts/sim.sh SwiftUIML-iPhone-15 com.apple.CoreSimulator.SimDeviceType.iPhone-15 com.apple.CoreSimulator.SimRuntime.iOS-17-0
#
# Common device types:
#   com.apple.CoreSimulator.SimDeviceType.iPhone-15
#   com.apple.CoreSimulator.SimDeviceType.iPhone-15-Pro
#   com.apple.CoreSimulator.SimDeviceType.iPad-Pro-11-inch-4th-generation
#
# To list available device types: xcrun simctl list devicetypes
# To list available runtimes: xcrun simctl list runtimes
#

set -e

ERRCODE=1

# Validate arguments
if [ -z "$1" ]; then
  echo "Error: No simulator name provided"
  echo "Usage: $0 <sim-name> <device-type> <runtime>"
  exit $ERRCODE
fi

if [ -z "$2" ]; then
  echo "Error: No device type provided"
  echo "Usage: $0 <sim-name> <device-type> <runtime>"
  exit $ERRCODE
fi

if [ -z "$3" ]; then
  echo "Error: No runtime provided"
  echo "Usage: $0 <sim-name> <device-type> <runtime>"
  exit $ERRCODE
fi

SIMNAME=$1
SIMDEVICETYPE=$2
SIMRUNTIME=$3

echo "🔍 Checking for simulator: ${SIMNAME}"

# Get list of all simulators
SIMS=$(xcrun simctl list --json)

# Check if simulator already exists
SIMUDID=$(echo "${SIMS}" | jq -r --arg SIMNAME "${SIMNAME}" '[.devices[][] | select(.name == $SIMNAME)] | first | .udid')

if [ -n "${SIMUDID}" ] && [ "${SIMUDID}" != "null" ]; then
    echo "✅ Simulator '${SIMNAME}' already exists"
    echo "   UDID: ${SIMUDID}"
    echo "${SIMUDID}"
    exit 0
fi

echo "📱 Creating new simulator: ${SIMNAME}"

# Validate device type exists
DEVICETYPES=$(xcrun simctl list devicetypes --json)
SIMDEVICETYPEID=$(echo "${DEVICETYPES}" | jq -r --arg SIMDEVICETYPE "${SIMDEVICETYPE}" '.devicetypes[] | select(.identifier == $SIMDEVICETYPE) | .identifier')

if [ -z "${SIMDEVICETYPEID}" ]; then
  echo "❌ Error: Device type '${SIMDEVICETYPE}' not found"
  echo "   Available device types:"
  xcrun simctl list devicetypes | grep "iPhone\|iPad" | head -10
  exit $ERRCODE
fi

# Validate runtime exists
RUNTIMES=$(xcrun simctl list runtimes --json)
SIMRUNTIMETYPEID=$(echo "${RUNTIMES}" | jq -r --arg SIMRUNTIME "${SIMRUNTIME}" '.runtimes[] | select(.identifier == $SIMRUNTIME) | .identifier')

if [ -z "${SIMRUNTIMETYPEID}" ]; then
  echo "❌ Error: Runtime '${SIMRUNTIME}' not found"
  echo "   Available runtimes:"
  xcrun simctl list runtimes | grep "iOS\|iPadOS" | head -10
  exit $ERRCODE
fi

# Create the simulator
echo "   Device Type: ${SIMDEVICETYPEID}"
echo "   Runtime: ${SIMRUNTIMETYPEID}"

NEWUDID=$(xcrun simctl create "${SIMNAME}" "${SIMDEVICETYPEID}" "${SIMRUNTIMETYPEID}")

if [ -n "${NEWUDID}" ]; then
  echo "✅ Simulator created successfully"
  echo "   UDID: ${NEWUDID}"
  echo "${NEWUDID}"
  exit 0
else
  echo "❌ Error: Failed to create simulator"
  exit $ERRCODE
fi
