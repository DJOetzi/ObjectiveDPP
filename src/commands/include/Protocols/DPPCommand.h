#pragma once
#import <Foundation/Foundation.h>

#include <dpp/dpp.h>

@protocol DPPCommand
    - (id) init : (const std::string&) nm andDescription : (const std::string&) desc andParameters : (const std::vector<dpp::command_option>) params;
    - (dpp::slashcommand) creatable_slashcommand : (dpp::snowflake) ctx_id;
    - (std::pair<std::string, id<DPPCommand>>) mapable_slashcommand;
    - (void) exec : (dpp::cluster&) ctx andSlashCommand : (dpp::slashcommand_t&) cmd;

    - (const std::string&) getName;
    - (void) setName : (const std::string&)nm;

    - (const std::string&) getDescription;
    - (void) setDescription : (const std::string&)desc;

    - (const std::vector<dpp::command_option>&) getParameters;
    - (void) setParameters : (const std::vector<dpp::command_option>)params;
@end