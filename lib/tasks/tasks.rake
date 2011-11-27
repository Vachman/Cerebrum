task :scan do
  puts cap_do('bridge','/usr/sbin/fping -a -t 50 10.90.90.90;true')
end 

task :scan2 do
 puts `ssh -p222 v.gevorkyan@89.255.93.158 '/usr/sbin/fping -a -t 50 10.90.90.90;true'`	
end

def cap_do(role,command)
  `cap doon:"#{role}" cmd="#{command}" 2>/dev/null `
end
