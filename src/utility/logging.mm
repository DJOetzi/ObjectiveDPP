#include <dpp/dpp.h>
#include <functional>
#import <Foundation/Foundation.h>

#import "include/logging.h"

auto nslog_logger() -> std::function<void(const dpp::log_t&)> {
    return [](const dpp::log_t& event) {
        if (event.severity > dpp::ll_trace) {
            @autoreleasepool {
                NSLog(@"%s: %s", dpp::utility::loglevel(event.severity).c_str(), event.message.c_str());
            }
            //std::cout << "[" << dpp::utility::current_date_time() << "] " << dpp::utility::loglevel(event.severity) << ": " << event.message << "\n";
        }
    };
}