
RegisterServerEvent('erp_customscripts:sync')
AddEventHandler('erp_customscripts:sync', function(target, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget,attachFlag)
	TriggerClientEvent('erp_customscripts:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget,attachFlag)
	TriggerClientEvent('erp_customscripts:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
end)

RegisterServerEvent('erp_customscripts:stop')
AddEventHandler('erp_customscripts:stop', function(targetSrc)
	TriggerClientEvent('erp_customscripts:cl_stop', targetSrc)
end)
