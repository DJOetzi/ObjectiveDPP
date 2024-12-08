#pragma once
#import <Foundation/Foundation.h>

#include <dpp/dpp.h>

@protocol DPPCommand
    - (id) init     : (const std::string&) desc andParameters : (const std::vector<dpp::command_option>) params;
    - (void) exec : (dpp::cluster&) ctx andSlashCommand : (dpp::slashcommand_t&) cmd;

    - (const std::string&) getDescription;
    - (void) setDescription : (const std::string&)desc;

    - (const std::vector<dpp::command_option>&) getParameters;
    - (void) setParameters : (const std::vector<dpp::command_option>)params;
@end