#!/usr/bin/env ruby
begin
  # Command class comment
  class Command
    ALL_COMMANDS = []

    def self.command_by_name(entered_str)
      @@entered_cmd = entered_str.split(" ")[0]
      entered_args = entered_str.split(" ")[1]
      command = Command::ALL_COMMANDS.find { |cmd| cmd.name == @@entered_cmd }
      raise "Command #{@@entered_cmd} not found. Type 'help' to get list of available commands" unless command
      command.new.run(entered_args)
    rescue RuntimeError => error
      puts error.message
      open('error.log', 'a') do |f|
        f.puts "#{error.message}\n\n"
      end
    end

    protected
    def say(*args)
      current_info = "\nCurrent time: #{Time.now.to_s.split(" ")[1]}\nScript name: #{File.basename(__FILE__)}\n\n"
      puts current_info
      final = ''
      args.each do |i|
        puts i
        final << "#{i}"
        open('output.log', 'a') do |f|
          f.puts "<Time>: #{Time.now.to_s.split(" ")[1]} : <Command:> #@@entered_cmd <Output>: #{final}"
        end
      end
    end
  end

  # class HelpCommand
  class HelpCommand < Command
    def self.name
      'help'
    end

    def self.description
      'return description for all commands'
    end

    def run (*args)
      if args[0]
        help_command = Command::ALL_COMMANDS.find { |cmd| cmd.name == args[0] }
        if help_command
          out = "#{help_command.name} - #{help_command.description}"
        elsif out = "Command #{args[0]} not found. Enter 'help' to get list of available commands"
        end
        say(out)
      else
        output = ''
        Command::ALL_COMMANDS.each do |cmd|
          output << "#{cmd.name} - #{cmd.description}__"
        end
        say(output.split('__'))
      end
    end
  end

  # class UptimeCommand
  class UptimeCommand < Command
    def self.name
      'uptime'
    end

    def self.description
      'returns system uptime'
    end

    def run(*args)
      time = File.read('/proc/uptime').split(' ')
      out = "Uptime: #{time[0].to_i / 3600}h #{(time[0].to_i % 3600) / 60}min #{(time[0].to_i % 3600) % 60}sec"
      say(out)
    rescue => e
      puts "Error message: #{e.message}"
      open('error.log', 'a') do |f|
        f.puts "#{e}\n\n"
      end
    end
  end

  # class DateCommand
  class DateCommand < Command
    def self.name
      'date'
    end

    def self.description
      'current date'
    end

    def run(*args)
      out = Time.now
      say(out)
    end
  end

  # class EchoCommand
  class EchoCommand < Command
    def self.name
      'echo'
    end

    def self.description
      'return first arg'
    end

    def run(*args)
      if args[0]
        out = "First arg - #{args[0]}"
      else
        out = 'No argument'
      end
      say(out)
    end
  end

  # class PingCommand
  class PingCommand < Command
    def self.name
      'ping'
    end

    def self.description
      'ping ip-address'
    end

    def run(*args)
      if args[0]
        %x(ping -c1 #{args[0]} &>/dev/null)
        $? == 0 ? (out = "ip-address #{args} is available") : (out = "ip-address #{args} is not available")
      else
        puts 'Enter ip-address:'
        ip_addr = gets.chomp.to_s.downcase
        %x(ping -c1 #{ip_addr} &>/dev/null)
        if $? == 0
          out = "ip-address #{args} is available"
        else
          out = "ip-address #{args} is not available"
        end
      end
      say(out)
    end
  end

  Command::ALL_COMMANDS.push(HelpCommand)
  Command::ALL_COMMANDS.push(UptimeCommand)
  Command::ALL_COMMANDS.push(DateCommand)
  Command::ALL_COMMANDS.push(EchoCommand)
  Command::ALL_COMMANDS.push(PingCommand)

  puts 'Greetings.'
  command = ''
  while command != 'exit'
    print '>> '
    command = gets.chomp.to_s.downcase
    if command != 'exit'
      Command.command_by_name(command)
    else
      puts 'Bye'
    end
  end
rescue Exception => err
  puts 'Have a nice day!'
  open('error.log', 'a') do |f|
    f.puts "#{err.message}\n\n"
  end
end
