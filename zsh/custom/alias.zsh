# fbr - checkout git branch (including remote branches)
function fbr() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD) &&
        branch=$(echo "$branches" |
            fzf-tmux -d $((2 + $(wc -l <<<"$branches"))) +m) &&
        git checkout "$(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")"
}

# fbr - checkout git branch
function fvim() {
    vim "$(fzf)"
}

# fkill - kill process
function fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]; then
        echo "$pid" | xargs kill -"${1:-9}"
    fi
}

# fd - cd to selected directory
function fd() {
    local dir
    dir=$(find "${1:-.}" -path '*/\.*' -prune \
        -o -type d -print 2>/dev/null | fzf +m) &&
        cd "$dir" || exit
}

function aw-setup() {
    sudo sysctl -w net.core.rmem_max=2147483647
    sudo ifconfig lo multicast
    source ./install/setup.zsh
    source /opt/ros/humble/setup.zsh
}

function core-dump-enable() {
    ulimit -c unlimited
    echo core | sudo tee /proc/sys/kernel/core_pattern
    echo -n 1 | sudo tee /proc/sys/kernel/core_uses_pid
}

function perf-enable() {
    sudo sh -c 'echo -1 > /proc/sys/kernel/perf_event_paranoid'
    sudo sh -c 'echo 0 > /proc/sys/kernel/kptr_restrict'
}

unsetopt nomatch
function ros2-reindex() {
    files=($(find ~/Downloads/ROSBAG_STORAGE -type d))
    for file in "${files[@]}"; do
        if [ ! -f "$file"/*.db3 ]; then
            unzstd -f "$file"/*.zst
            ros2 bag reindex "$file" sqlite3
        fi
    done
}

function ros2-kill() {
    pgrep -f ros2 | awk '{ print "kill -9", $1 }' | sh
    pgrep -f rviz2 | awk '{ print "kill -9", $1 }' | sh
    pgrep -f python3 | awk '{ print "kill -9", $1 }' | sh
    pgrep -f rqt_reconfigure | awk '{ print "kill -9", $1 }' | sh
    pgrep -f component_container | awk '{ print "kill -9", $1 }' | sh
    pgrep -f aggregator_node | awk '{ print "kill -9", $1 }' | sh
    pgrep -f robot_state_publisher | awk '{ print "kill -9", $1 }' | sh
    pgrep -f topic_tools | awk '{ print "kill -9", $1 }' | sh
    pgrep -f "ros-args" | awk '{ print "kill -9", $1 }' | sh
}

function cb() {
    colcon build --symlink-install \
        --continue-on-error \
        --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_C_COMPILER_LAUNCHER=ccache \
        -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
        -DBUILD_CPP_MOCK_SCENARIOS=ON "${@}"
}

alias gs='git status'
alias gl='git log'
