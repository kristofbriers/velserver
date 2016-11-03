
# Mysql related sub functions to get the data out of the mysql database

# Get all modules from the mysql database
sub get_all_modules_from_mysql {
   my %data = &fetch_data ($global{dbh},"select * from modules","address" ) ;

   foreach my $address (sort keys %data ) {
      my $type   = $data{$address}{type} ; # Handier var
      next if $type eq '' ;
      my $status = $data{$address}{status} ; # Handier var

      %{$global{Vars}{Modules}{Address}{$address}{ModuleInfo}} = %{$data{$address}} ; # List of all modules
      $global{Vars}{Modules}{PerStatus}{$status}{ModuleList}{$address} = "yes" ; # List of all modules per status
      $global{Vars}{Modules}{PerType}{$type}{ModuleList}{$address} = "yes" ; # List of alle modules per type module
   }

   &get_all_modules_info_from_mysql ;
}

# Loop all found modules and load the extra info from the mysql database
sub get_all_modules_info_from_mysql {
   foreach my $address (sort keys (%{$global{Vars}{Modules}{PerStatus}{Found}{ModuleList}}) ) {
      my @SubAddr ;

      my %data = &fetch_data ($global{dbh},"select * from modules_info where `address`='$address'","data" ) ;
      foreach my $data (sort keys (%data)) {

         # Sub addresses are kept in 'SubAddr' for easy access
         if ( $data =~ /^SubAddr/ ) {
            # TODO: save type per sub address, sometimes info is transmitted with the sub address like COMMAND_MODULE_STATUS
            my $SubAddr = $data{$data}{value} ; # Handier var
            push @SubAddr, $SubAddr ;
         } else {
            $global{Vars}{Modules}{Address}{$address}{ModuleInfo}{$data} = $data{$data}{value} ;
         }
      }
      if ( @SubAddr ) {
         my $SubAddr = join ",", @SubAddr ;
         $global{Vars}{Modules}{Address}{$address}{ModuleInfo}{SubAddr} = $SubAddr ;
      }

      my %datatemp = &fetch_data ($global{dbh},"select * from modules_channel_info where `address`='$address'" ) ;
      foreach my $key (sort keys (%datatemp)) {
         my $date    = $datatemp{$key}{date} ;    # Handier var
         my $address = $datatemp{$key}{address} ; # Handier var
         my $channel = $datatemp{$key}{channel} ; # Handier var
         my $data    = $datatemp{$key}{data} ;    # Handier var
         my $value   = $datatemp{$key}{value} ;   # Handier var
         $global{Vars}{Modules}{Address}{$address}{ChannelInfo}{$channel}{$data}{value} = $value ;
         $global{Vars}{Modules}{Address}{$address}{ChannelInfo}{$channel}{$data}{date}  = $date ;
      }
   }
}

return 1 ;