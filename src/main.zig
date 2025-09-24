const std = @import("std");

pub fn main() !void {
    gamblersRuin(100, 0);
}

fn gamblersRuin(money: u8, attempts: u16) void {
    if (money == 0) {
        std.debug.print("No more money, you lost it all after {d} attempts! RIP BOZO!\n", .{attempts});
        return;
    }
    if (money == 200) {
        std.debug.print("You won the casino after {d} attempts!\n", .{attempts});
        return;
    }
    const win = std.crypto.random.boolean();
    if (win) {
        std.debug.print("Attemps: {d} - You won!\nCurrent money: {d} dollars.\n\n", .{ attempts, money + 1 });
        return gamblersRuin(money + 1, attempts + 1);
    }
    std.debug.print("Attemps: {d} - You lost!\nCurrent money: {d} dollars.\n\n", .{ attempts, money - 1 });
    return gamblersRuin(money - 1, attempts + 1);
}
