#import <Foundation/Foundation.h>
#include <dpp/dpp.h>

#import "commands/include/Protocols/DPPCommand.h"
#import "commands/include/Ping.h"
#import "commands/include/Info.h"
#import "commands/include/Help.h"

auto main() -> int {
    nlohmann::json configdocument;
    std::ifstream configfile("../data/config.json");
    configfile >> configdocument;

    /* Setup the bot */
    dpp::cluster bot(configdocument["token"]);

    bot.on_log(dpp::utility::cout_logger());

    @autoreleasepool {
        std::vector<id<DPPCommand>> command_list = {
                // add commands here
                [[Ping alloc] init:"ping" andDescription:"A ping command" andParameters:{}],
                [[Info alloc] init:"info" andDescription:"An info command" andParameters:{}],
                [[Help alloc] init:"help" andDescription:"A help command" andParameters:{{ dpp::command_option(dpp::co_string, "term", "Help term", false) }}],
        };
        // TODO: register and handle commands properly!
        std::map<std::string, id<DPPCommand>> commands = {};

        for(id<DPPCommand> cmd : command_list)
            commands[[cmd getName]] = cmd;

        bot.on_slashcommand([&bot, &commands](const dpp::slashcommand_t& event) {
            [commands[event.command.get_command_name()] exec:bot andSlashCommand:event];
        });

        bot.on_ready([&bot, &command_list](const dpp::ready_t& event) {
            @autoreleasepool {
                if (dpp::run_once<struct register_bot_commands>()) {
                    //bot.global_command_create(dpp::slashcommand("ping", "Ping pong!", bot.me.id));
                    std::vector<dpp::slashcommand> tmp_commands{};
                    tmp_commands.reserve(command_list.size());

                    for(id<DPPCommand> cmd : command_list)
                        tmp_commands.push_back([cmd creatable_slashcommand:bot.me.id]);

                    //bot.guild_bulk_command_create({}, 581800183583604746);
                    bot.global_bulk_command_create(tmp_commands);

                    NSLog(@"SUCCESSFULLY REGISTERED COMMANDS!");
                }
            }
        });

        bot.start(dpp::st_wait);
    }
}