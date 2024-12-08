#import "include/BaseCommand.h"

@implementation BaseCommand : NSObject
    - (id) init     : (const std::string&) desc andParameters : (std::vector<dpp::command_option>) params {
        if ( self = [super init] ) {
            description = desc;
            parameters = params;
        }
        return self;
    }

    - (void) exec   : (dpp::cluster&) ctx andSlashCommand : (dpp::slashcommand_t&) cmd {
    }

    - (const std::string&) getDescription {
        return description;
    }
    - (void) setDescription : (const std::string&)desc {
        description = desc;
    }

    - (const std::vector<dpp::command_option>&) getParameters {
        return parameters;
    }
    - (void) setParameters : (const std::vector<dpp::command_option>)params {
        parameters = params;
    }
@end