#import <Foundation/Foundation.h>
#include <dpp/dpp.h>

#import "commands/include/Protocols/DPPCommand.h"

std::vector<id<DPPCommand>> command_list = {
};

int main() {
    nlohmann::json configdocument;
    std::ifstream configfile("../data/config.json");
    configfile >> configdocument;

    /* Setup the bot */
    dpp::cluster bot(configdocument["token"]);

    bot.on_log(dpp::utility::cout_logger());

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

    bot.on_slashcommand([](const dpp::slashcommand_t& event) {
        if (event.command.get_command_name() == "ping") {
            event.reply("Pong!");
        }
    });

    bot.on_ready([&bot](const dpp::ready_t& event) {
        if (dpp::run_once<struct register_bot_commands>()) {
            bot.global_command_create(dpp::slashcommand("ping", "Ping pong!", bot.me.id));
        }
    });

    bot.start(dpp::st_wait);
}