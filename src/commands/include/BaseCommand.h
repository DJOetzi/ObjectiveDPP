#pragma once

#include <iostream>

#import <Foundation/Foundation.h>
#import "Protocols/DPPCommand.h"

@interface BaseCommand : NSObject<DPPCommand>
    // private properties
    {
        std::string description;
        std::vector<dpp::command_option> parameters;
    }
    - (id) init     : (const std::string&) desc andParameters : (const std::vector<dpp::command_option>) params;
    - (void) exec   : (dpp::cluster&) ctx andSlashCommand : (dpp::slashcommand_t&) cmd;

    // region getters and setters
    - (const std::string&) getDescription;
    - (void) setDescription : (const std::string&)desc;

    - (const std::vector<dpp::command_option>&) getParameters;
    - (void) setParameters : (const std::vector<dpp::command_option>)params;
    // endregion
@end