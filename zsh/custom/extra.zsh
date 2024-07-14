# colcon
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh

# ros2
source /opt/ros/humble/setup.zsh
source /opt/ros/humble/share/ros2cli/environment/ros2-argcomplete.zsh

export COLCON_LOG_LEVEL="ERROR"
export RCUTILS_COLORIZED_OUTPUT=1
export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity} {time}] [{name}]: {message}"

# dds
export ROS_LOCALHOST_ONLY=1
# export ROS_DOMAIN_ID=100
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

# cuda
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/libtorch/lib:$LD_LIBRARY_PATH"

# deno
export PATH="$HOME/.deno/bin:$PATH"

eval "$(gh completion -s zsh)"
