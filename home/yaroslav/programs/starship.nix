{ config, pkgs,... }:

{
  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = false; 

    format = ''
      $all
    '';

    right_format = "$time";

    character = {
      success_symbol = "[  ](fg:#98c379)[ 󰖔 ](fg:#4487ff)";
      error_symbol = "[  ](fg:#d56767)[  ](fg:#d56767)";
    };

    line_break.disabled = true;

    aws.symbol = " ";
    battery = {
      disabled = false;
      full_symbol = "";
      charging_symbol = " ";
      discharging_symbol = " ";
      unknown_symbol = "";
      empty_symbol = "";
    };

    cmake.symbol = "喝";
    cmd_duration.min_time = 2000;
    conda.symbol = " ";
    crystal.symbol = " ";
    dart.symbol = " ";
    directory.style = "italic fg:#738895"; 
    docker_context.symbol = " ";
    dotnet.symbol = " ";
    elixir.symbol = " ";
    env_var.disabled = true;
    erlang.symbol = " ";
    gcloud.symbol = "☁️ ";
    git_branch = {
      disabled = false;
      symbol = " ";
      style = "fg:#7c789b";
      format = "on [$symbol$branch(:$remote_branch)]($style)";
    };
    git_commit.commit_hash_length = 4;
    git_state.rebase = "rebasing";
    git_status.stashed = "  $count";
    golang.symbol = " ";
    helm.symbol = "ﴱ ";
    hostname.trim_at = ".";
    java.symbol = " ";
    jobs.symbol = "  ";
    julia.symbol = " ";
    kubernetes.symbol = "☸︎";
    memory_usage.threshold = 75;
    hg_branch.symbol = " ";
    nim.symbol = " ";
    nix_shell.symbol = " ";
    nodejs.symbol = " ";
    ocaml.symbol = "🐫 ";
    package.symbol = " ";
    perl.symbol = "🐪 ";
    php.symbol = " ";
    purescript.symbol = "<=>";
    python = {
      disabled = false;
      pyenv_version_name = false;
      python_binary = "python";
      format = "via [$symbol(\($virtualenv\) )]($style)";
    };
    ruby.symbol = " ";
    rust.symbol = " ";
    shlvl.symbol = "";
    singularity.symbol = "S";
    swift.symbol = "ﯣ ";
    status.symbol = "";
    terraform.symbol = "行";
    username = {
      disabled = true;
      show_always = true;
    };
    zig.symbol = "［Z］";
  };
} 

