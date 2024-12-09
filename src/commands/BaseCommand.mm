#import "include/BaseCommand.h"

@implementation BaseCommand : NSObject
    - (id) init     : (const std::string&) nm andDescription : (const std::string&) desc andParameters : (const std::vector<dpp::command_option>) params {
        if ( self = [super init] ) {
            name = nm;
            description = desc;
            parameters = params;
        }
        return self;
    }

    - (dpp::slashcommand) creatable_slashcommand : (dpp::snowflake) ctx_id {
        return dpp::slashcommand(name, description, ctx_id);
    }

    - (std::pair<std::string, id<DPPCommand>>) mapable_slashcommand {
        return std::make_pair(name, self);
    }

    - (void) exec   : (dpp::cluster&) ctx andSlashCommand : (const dpp::slashcommand_t&) cmd {
    }

    - (const std::string&) getName {
        return name;
    }
    - (void) setName : (const std::string&)nm {
        name = nm;
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