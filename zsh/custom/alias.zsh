# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fbr - checkout git branch
fvim() {
  vim $(fzf)
}

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

aw-setup() {
  sudo sysctl -w net.core.rmem_max=2147483647
  sudo ifconfig lo multicast
  source ./install/setup.zsh
  source /opt/ros/humble/setup.zsh
}

core-dump-enable() {
  ulimit -c unlimited
  echo core | sudo tee /proc/sys/kernel/core_pattern
  echo -n 1 | sudo tee /proc/sys/kernel/core_uses_pid
}

perf-enable() {
  sudo sh -c 'echo -1 > /proc/sys/kernel/perf_event_paranoid'
  sudo sh -c 'echo 0 > /proc/sys/kernel/kptr_restrict'
}

analyze-trajectory() {
  ros2 launch planning_debug_tools trajectory_analyzer.launch.xml |
  ros2 run plotjuggler plotjuggler
}
unsetopt nomatch
ros2-reindex() {
  files=(`find ~/Downloads/ROSBAG_STORAGE -type d`)
  for file in $files; do
    if [ ! -f $file/*.db3 ]; then
      unzstd -f $file/*.zst
      ros2 bag reindex $file sqlite3
    fi
  done
}

alias ros2-kill='pkill -KILL -f ros | pkill ros2 && pkill rviz2 && pkill aggregator_node && ps aux | grep python3 | grep ros2 | grep -v grep | awk '{ print 'kill ', $2 }' | sh && ps aux | grep python3 | grep rqt_reconfigure | grep -v grep | awk '{ print 'kill ', $2 }' | sh && ps aux | grep component_container | grep -v grep | awk '{ print 'kill ', $2 }' | sh && ps aux | grep robot_state_publisher | grep -v grep | awk '{ print 'kill ', $2 }' | sh && ps aux | grep topic_tools/relay | grep -v grep | awk '{ print 'kill ', $2 }' | sh && ps aux | grep 'ros-args' | grep -v grep | awk '{ print 'kill ', $2 }' | sh'

alias gs='git status'
alias gl='git log'

alias colcon-build-wno-pedantic='(){MAKEFLAGS=$1 colcon build --symlink-install --cmake-args -DCMAKE_CXX_FLAGS="-Wno-error=pedantic" -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DBUILD_CPP_MOCK_SCENARIOS=ON --continue-on-error $2 $3}'
alias colcon-build='(){MAKEFLAGS=$1 colcon build --symlink-install --cmake-args -DCMAKE_CXX_FLAGS="-w" -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_COMPILER_LAUNCHER=ccache --continue-on-error $2 $3}'

alias webauto-run='(){webauto ci scenario run --project-id $1 --scenario-id $2 --scenario-parameters $3}'

alias bag-reindex='(){ros2 bag reindex $1 sqlite3}'
alias bag-play='(){ros2 bag play $1 --clock 100}'
