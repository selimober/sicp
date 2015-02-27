exec { "set local":
  command => "echo 'LC_ALL=\"en_US.UTF-8\"' >> /etc/environment",
  path => "/bin"
}

# Update apt before installing any packages

exec { "apt-update":
  command => "/usr/bin/apt-get update",
  require => Exec["set local"]
}

class { 'ohmyzsh': }
ohmyzsh::install { 'vagrant': } ->
ohmyzsh::theme { 'vagrant': theme => 'robbyrussell' } ->
ohmyzsh::plugins { 'vagrant': plugins => 'git' } ->
ohmyzsh::upgrade { 'vagrant': } ->
package { 'mit-scheme':
    ensure => 'latest',
} ->

exec { "vim":
  command => "/usr/bin/git clone https://github.com/selimober/dotfiles.git",
  require => Package['mit-scheme'],
  user => 'vagrant'
} ->

exec { "vundle":
  command => "/usr/bin/git clone https://github.com/gmarik/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim",
  require => Package['mit-scheme'],
  user => 'vagrant'
} ->

exec { "dotfiles":
  command => "/bin/cp -r /home/vagrant/dotfiles/vim/. /home/vagrant",
  require => Exec["vim"],
  user => 'vagrant'
}

class { 'stdlib': }

file_line { 'slimv':
  path => "/home/vagrant/.vimrc",
  line => "Plugin 'kovisoft/slimv'",
  after => "Plugin 'gmarik/Vundle.vim'",
  require => Exec["dotfiles"]
}

exec { "install vim plugins":
  environment => ["HOME=/home/vagrant"],
  command => "/usr/bin/vim +PluginInstall +qall",
  require => File_line["slimv"],
  user => 'vagrant'
}
