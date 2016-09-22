#!/bin/bash
NGT_PY_ROOT=$TOP/ngt/py/ngt
NGT_GUEST_BIN=$NGT_PY_ROOT/guest_agent_service
NGT_ORION_BASE=$TOP/orion/py/orion
GUEST_BINPATH=/usr/local/nutanix/bin
GUEST_ORION_BASE=/usr/local/nutanix/ngt/orion
GUEST_NGT_BASE=/usr/local/nutanix/ngt/ngt
#guest_ips=( '10.5.77.99' )
#guest_ips="10.5.118.217"
guest_ips=$1
echo $guest_ips
# NSSH="sshpass -p nutanix/4u ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o PubkeyAuthentication=no -l root"
# NSCP="sshpass -p nutanix/4u scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o PubkeyAuthentication=no -o User=root"
NSSH=ssh
NSCP=scp
if [[ -e $DEBUG ]]; then
    NSSH="echo $NSSH"
    NSCP="echo $NSCP"
fi
die () {
    exit 1
}
for ip in "${guest_ips}"; do
    echo "Copying to " $ip
    $NSSH $ip "/etc/init.d/ngt_guest_agent stop" || die
    $NSSH $ip "find $GUEST_NGT_BASE -name '*.pyc' | xargs -- rm"
    $NSSH $ip "find $GUEST_BIN_PATH -name '*.pyc' | xargs -- rm"
    $NSCP $TOP/build/ngt/interface/*.py $ip:$GUEST_NGT_BASE/interface || die
    $NSCP $NGT_PY_ROOT/interface/* $ip:$GUEST_NGT_BASE/interface  || die
    $NSCP $NGT_PY_ROOT/tools/env.py $ip:$GUEST_BINPATH || die
    $NSCP $NGT_GUEST_BIN/* $ip:$GUEST_BINPATH || die
    $NSSH $ip "mkdir -p $GUEST_BINPATH/guest_agent_service"
    #$NSCP $NGT_GUEST_BIN/volume_plugin_{base,linux}.py $ip:$GUEST_BINPATH/guest_agent_service/ || die
    $NSSH $ip "mkdir -p $GUEST_ORION_BASE/docker"
    $NSCP $TOP/build/orion/*.py $ip:$GUEST_ORION_BASE || die
    $NSCP -r $NGT_ORION_BASE/* $ip:$GUEST_ORION_BASE || die
    # echo $NSCP -r $NGT_ORION_BASE/volume_plugin $ip:$GUEST_BINPATH/orion/
    $NSCP -r $NGT_ORION_BASE/docker/* $ip:$GUEST_ORION_BASE/docker || die
    $NSCP -r $NGT_ORION_BASE/volume_plugin/* $ip:$GUEST_ORION_BASE/volume_plugin || die
    $NSCP -r $NGT_ORION_BASE/util/* $ip:$GUEST_ORION_BASE/util || die
    $NSCP -r $NGT_ORION_BASE/ngt/* $ip:$GUEST_ORION_BASE/ngt || die
    $NSSH $ip "/etc/init.d/ngt_guest_agent start" || die
done

