# pre-defined ChannelTypes
#    Blind 
#    Button 
#    ButtonCounter 
#    Dimmer 
#    LightSensor 
#    Relay 
#    Sensor 
#    SensorNumber 
#    Temperature 
#    ThermostatChannel 
#
#  Rules:
#    Button
#       + ButtongLong
#    ButtonCounter
#       Divider
#       CounterRaw
#       Counter
#       CounterCurrent
#          OR
#       Button
#       ButtonLong
#    Temperature
#       + ThermostatCoHeode
#       + ThermostatMode
#       + ThermostatTarget
#
# All ChannelTypes:
#    Blind 
#    Button 
#    ButtongLong
#    Divider
#    Counter
#    CounterRaw
#    CounterCurrent
#    Dimmer 
#    LightSensor 
#    Relay 
#    Sensor 
#    SensorNumber 
#    Temperature 
#    ThermostatCoHeode
#    ThermostatMode
#    ThermostatTarget
#    ThermostatChannel 

$global{Cons}{ChannelTypes}{Blind}{Get}{Message} = "EC" ;
$global{Cons}{ChannelTypes}{Blind}{Set}{Match}{STOP}{Message}  = "04" ;
$global{Cons}{ChannelTypes}{Blind}{Set}{Match}{UP}{Message}    = "05" ;
$global{Cons}{ChannelTypes}{Blind}{Set}{Match}{DOWN}{Message}  = "06" ;
$global{Cons}{ChannelTypes}{Blind}{Set}{Match}{'\d+'}{Message} = "1C" ; 
$global{Cons}{ChannelTypes}{Blind}{Set}{Match}{'\d+'}{Action}  = "POSITION" ; # Default Action = $Match
$global{Cons}{ChannelTypes}{Blind}{openHAB}{ItemIcon}        = "rollershutter" ;
$global{Cons}{ChannelTypes}{Blind}{openHAB}{ItemStateFormat} = "[%s %%]" ;
$global{Cons}{ChannelTypes}{Blind}{openHAB}{ItemType}        = "Rollershutter" ;

$global{Cons}{ChannelTypes}{Button}{Get}{Message} = "00" ;
$global{Cons}{ChannelTypes}{Button}{Set}{Match}{ON}{Message}  = "00" ;
$global{Cons}{ChannelTypes}{Button}{Set}{Match}{OFF}{Message}  = "00" ;
$global{Cons}{ChannelTypes}{Button}{openHAB}{ItemType} = "Switch" ;

# ButtonLong is the same as Button except for Append2Name
$global{Cons}{ChannelTypes}{ButtonLong}{BasedOn} = "Button" ; # Copy of Button
$global{Cons}{ChannelTypes}{ButtonLong}{openHAB}{Append2Name} = "Long" ;
$global{Cons}{ChannelTypes}{ButtonLong}{openHAB}{ItemType}    = "Switch" ;

$global{Cons}{ChannelTypes}{Counter}{Get}{Message} = "BE" ;
$global{Cons}{ChannelTypes}{Counter}{openHAB}{ItemIcon} = "chart" ;
$global{Cons}{ChannelTypes}{Counter}{openHAB}{ItemType} = "Number" ;

$global{Cons}{ChannelTypes}{CounterRaw}{BasedOn} = "Counter" ;
$global{Cons}{ChannelTypes}{CounterRaw}{openHAB}{ItemIcon} = "chart" ;
$global{Cons}{ChannelTypes}{CounterRaw}{openHAB}{ItemType} = "Number" ;

$global{Cons}{ChannelTypes}{CounterCurrent}{BasedOn} = "Counter" ;
$global{Cons}{ChannelTypes}{CounterCurrent}{openHAB}{ItemIcon} = "chart" ;
$global{Cons}{ChannelTypes}{CounterCurrent}{openHAB}{ItemType} = "Number" ;

$global{Cons}{ChannelTypes}{Divider}{BasedOn} = "Counter" ;
$global{Cons}{ChannelTypes}{Divider}{openHAB}{ItemType} = "Number" ;

$global{Cons}{ChannelTypes}{Dimmer}{Get}{Message} = "" ;
$global{Cons}{ChannelTypes}{Dimmer}{Set}{Match}{'\d+'}{Message} = "07" ; # &dim_value
$global{Cons}{ChannelTypes}{Dimmer}{Set}{Match}{'\d+'}{Action} = "LEVEL" ; # &dim_value, Default Action = $Match
$global{Cons}{ChannelTypes}{Dimmer}{Set}{Match}{ON}{Message} = "07" ; # &dim_value
$global{Cons}{ChannelTypes}{Dimmer}{Set}{Match}{OFF}{Message} = "07" ; # &dim_value
$global{Cons}{ChannelTypes}{Dimmer}{openHAB}{ItemIcon} = "slider" ;
$global{Cons}{ChannelTypes}{Dimmer}{openHAB}{ItemStateFormat} = "[%s %%]" ;
$global{Cons}{ChannelTypes}{Dimmer}{openHAB}{ItemType} = "Dimmer" ;

$global{Cons}{ChannelTypes}{LightSensor}{openHAB}{ItemType} = "Number" ;
$global{Cons}{ChannelTypes}{LightSensor}{openHAB}{ItemStateFormat} = "[%.0f]" ;

$global{Cons}{ChannelTypes}{Memo}{Set}{Match}{'.'}{Message} = "AC" ; # &send_memo
$global{Cons}{ChannelTypes}{Memo}{Modules} = "28" ; #  This is the only ChannelType where we set the list of Modules manually because there is no channel for Memo. TODO: Create a channel for Memo so we can send and receive memo text remotely

$global{Cons}{ChannelTypes}{Relay}{Get}{Message} = "FB" ;
$global{Cons}{ChannelTypes}{Relay}{Set}{Match}{ON}{Message} = "02" ; # &relay_on
$global{Cons}{ChannelTypes}{Relay}{Set}{Match}{OFF}{Message} = "01" ; # &relay_off
$global{Cons}{ChannelTypes}{Relay}{openHAB}{ItemIcon} = "switch" ;
$global{Cons}{ChannelTypes}{Relay}{openHAB}{ItemType} = "Switch" ;

$global{Cons}{ChannelTypes}{Sensor}{Get}{Message} = "00" ;
$global{Cons}{ChannelTypes}{Sensor}{openHAB}{ItemType} = "Switch" ;

$global{Cons}{ChannelTypes}{SensorNumber}{Get}{Message} = "AC" ;
$global{Cons}{ChannelTypes}{SensorNumber}{openHAB}{ItemType} = "Number" ;

$global{Cons}{ChannelTypes}{LightSensor}{Get}{Message} = "ED" ;

$global{Cons}{ChannelTypes}{Temperature}{Get}{Message} = "" ;
$global{Cons}{ChannelTypes}{Temperature}{openHAB}{ItemIcon} = "temperature" ;
$global{Cons}{ChannelTypes}{Temperature}{openHAB}{ItemStateFormat} = "[%.1f °C]" ;
$global{Cons}{ChannelTypes}{Temperature}{openHAB}{ItemType} = "Number" ;

$global{Cons}{ChannelTypes}{ThermostatChannel}{Get}{Message} = "00" ;
$global{Cons}{ChannelTypes}{ThermostatChannel}{openHAB}{ItemType} = "Switch" ;

$global{Cons}{ChannelTypes}{ThermostatCoHeMode}{BasedOn} = "Temperature" ;
$global{Cons}{ChannelTypes}{ThermostatCoHeMode}{Set}{Match}{'[01]'}{Message} = "DF" ;
$global{Cons}{ChannelTypes}{ThermostatCoHeMode}{openHAB}{ItemIcon} = "temperature" ;
$global{Cons}{ChannelTypes}{ThermostatCoHeMode}{openHAB}{Append2Name} = "Cool/Heat mode" ;
$global{Cons}{ChannelTypes}{ThermostatCoHeMode}{openHAB}{ItemType} = "Number" ;

$global{Cons}{ChannelTypes}{ThermostatMode}{BasedOn} = "Temperature" ;
$global{Cons}{ChannelTypes}{ThermostatMode}{Set}{Match}{'[0123]+'}{Message} = "DB" ;
$global{Cons}{ChannelTypes}{ThermostatMode}{openHAB}{ItemIcon} = "temperature" ;
$global{Cons}{ChannelTypes}{ThermostatMode}{openHAB}{Append2Name} = "mode" ;
$global{Cons}{ChannelTypes}{ThermostatMode}{openHAB}{ItemType} = "Number" ;

$global{Cons}{ChannelTypes}{ThermostatTarget}{BasedOn} = "Temperature" ;
$global{Cons}{ChannelTypes}{ThermostatTarget}{Set}{Match}{'[\d.]+'}{Message} = "E4" ;
$global{Cons}{ChannelTypes}{ThermostatTarget}{openHAB}{ItemIcon} = "temperature" ;
$global{Cons}{ChannelTypes}{ThermostatTarget}{openHAB}{Append2Name} = "temperature target" ;
$global{Cons}{ChannelTypes}{ThermostatTarget}{openHAB}{ItemStateFormat} = "[%.1f °C]" ;
$global{Cons}{ChannelTypes}{ThermostatTarget}{openHAB}{ItemType} = "Number" ;

#print Dumper \%{$global{Cons}{ChannelTypes}} ;

# ButtonCounter in the config file is actually Counter. So merge Counter with ButtonCounter.
%{$global{Cons}{ChannelTypes}{Counter}} = %{ merge( \%{$global{Cons}{ChannelTypes}{Counter}}, \%{$global{Cons}{ChannelTypes}{ButtonCounter}} ) };

# Loop all Channel Types
foreach my $ChannelType (sort keys %{$global{Cons}{ChannelTypes}}) {
   # If this ChannelType is based on an other, take over te relelvant settings
   if ( defined $global{Cons}{ChannelTypes}{$ChannelType}{BasedOn} ) {
      my $BasedOn = $global{Cons}{ChannelTypes}{$ChannelType}{BasedOn} ;

      #print "$BasedOn -> $ChannelType\n" ;
      $global{Cons}{ChannelTypes}{$ChannelType}{Modules} = $global{Cons}{ChannelTypes}{$BasedOn}{Modules} ;
      %{$global{Cons}{ChannelTypes}{$ChannelType}{Get}} = %{ merge( \%{$global{Cons}{ChannelTypes}{$ChannelType}{Get}}, \%{$global{Cons}{ChannelTypes}{$BasedOn}{Get}} ) } if $global{Cons}{ChannelTypes}{$BasedOn}{Get} ;
      %{$global{Cons}{ChannelTypes}{$ChannelType}{Set}} = %{ merge( \%{$global{Cons}{ChannelTypes}{$ChannelType}{Set}}, \%{$global{Cons}{ChannelTypes}{$BasedOn}{Set}} ) } if $global{Cons}{ChannelTypes}{$BasedOn}{Set} ;
   }

   # Loop all Module Types to see what's supported based on the Message
   foreach my $ModuleType (sort split ",", $global{Cons}{ChannelTypes}{$ChannelType}{Modules}) {
      if ( defined $global{Cons}{ChannelTypes}{$ChannelType}{Get} ) {
         if ( $global{Cons}{ChannelTypes}{$ChannelType}{Get}{Message} eq "" ) {
            $global{Cons}{ChannelTypes}{$ChannelType}{Module}{$ModuleType}{Action}{Get} = "yes" ;
         } else {
            foreach my $Message (split ",", $global{Cons}{ChannelTypes}{$ChannelType}{Get}{Message}) {
               if ( defined $global{Cons}{ModuleTypes}{$ModuleType}{Messages}{$Message} and
                    defined $global{Cons}{ModuleTypes}{$ModuleType}{Messages}{$Message}{Data} ) {
                  $global{Cons}{ChannelTypes}{$ChannelType}{Module}{$ModuleType}{Action}{Get} = "yes" ;
               } else {
                  # print "NO MESSAGE: ChannelType=$ChannelType, ModuleType=$ModuleType, Message=$Message\n" ;
               }
            }
         }
      }

      if ( defined $global{Cons}{ChannelTypes}{$ChannelType}{Set} ) {
         foreach my $Match (sort keys %{$global{Cons}{ChannelTypes}{$ChannelType}{Set}{Match}} ) {
            my $Message = $global{Cons}{ChannelTypes}{$ChannelType}{Set}{Match}{$Match}{Message} ;
            if ( defined $global{Cons}{ModuleTypes}{$ModuleType}{Messages}{$Message} ) {
               $global{Cons}{ChannelTypes}{$ChannelType}{Module}{$ModuleType}{Action}{Set} = "yes" ;
            } else {
               # print "NO SET: ChannelType=$ChannelType, ModuleType=$ModuleType, Match=$Match, Message=$Message\n" ;
            }
         }
      }
   }
}

return 1 ;
