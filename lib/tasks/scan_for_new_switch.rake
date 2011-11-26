task :scan_for_new_switch do
  puts cap_do('bridge','/usr/sbin/fping -a -t 50 10.90.90.90;true')
end 


def cap_do(role,command)
  `cap doon:"#{role}" cmd="#{command}" 2>/dev/null `
end