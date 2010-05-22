#!/usr/bin/perl -w
#

use strict;


my $test
    = {
       command_definitions => [
			       {
				command => './bin/publications-version',
				command_tests => [
						  {
						   # $Format: "description => \"Does the version information match with ${package}-${label} ?\","$
description => "Does the version information match with userdocs-userdocs-6 ?",
						   # $Format: "read => \"${package}-${label}\","$
read => "userdocs-userdocs-6",
						   write => "version",
						  },
						 ],
				description => "check version information",
			       },
			      ],
       description => "documentation versioning",
       name => 'version.t',
      };


return $test;

