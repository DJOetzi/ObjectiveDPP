#import <Foundation/Foundation.h>
#include <dpp/dpp.h>

#import "commands/include/Protocols/DPPCommand.h"
#import "commands/include/Ping.h"

// TODO: register and handle commands properly!
std::map<std::string, id<DPPCommand>> commands = {
        // TODO: implement and add commands
        /*{ "ping", { "A ping command", handle_ping }},
        { "help", {
                    "A help command", handle_help , {
                                                            { dpp::command_option(dpp::co_string, "term", "Help term", false) },
                                                    }
                  }},
        { "info", { "An info command", handle_info }},*/
};

int main() {
    nlohmann::json configdocument;
    std::ifstream configfile("../data/config.json");
    configfile >> configdocument;

    @autoreleasepool {
        /* Setup the bot */
        dpp::cluster bot(configdocument["token"]);

        bot.on_log(dpp::utility::cout_logger());

        std::vector<id<DPPCommand>> command_list = {
                [[Ping alloc] init:"ping" andDescription:"Ping pong pung" andParameters:{}]
        };

        for(id<DPPCommand> cmd : command_list)
            commands[[cmd getName]] = cmd;

        bot.on_slashcommand([&bot](const dpp::slashcommand_t& event) {
            [commands[event.command.get_command_name()] exec:bot andSlashCommand:event];
        });

        bot.on_ready([&bot, &command_list](const dpp::ready_t& event) {
            if (dpp::run_once<struct register_bot_commands>()) {
                //bot.global_command_create(dpp::slashcommand("ping", "Ping pong!", bot.me.id));
                bot.global_bulk_command_create({});

                for(id<DPPCommand> cmd : command_list)
                    bot.global_command_create([cmd creatable_slashcommand:bot.me.id]);
            }
        });

        bot.start(dpp::st_wait);
    }
}