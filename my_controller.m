% MATLAB controller for Webots
% File:          my_controller.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;

% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
motor1 = wb_robot_get_device('motor1');
motor2 = wb_robot_get_device('motor2');
motor3 = wb_robot_get_device('motor3');
motor4 = wb_robot_get_device('motor4');
motor5 = wb_robot_get_device('motor5');
motor6 = wb_robot_get_device('motor6');


Lidar = wb_robot_get_device('Lidar');


wb_motor_set_position (motor1 ,inf);
wb_motor_set_velocity (motor1 ,2);  
wb_motor_set_position (motor2 ,inf);
wb_motor_set_velocity (motor2 ,2);  
wb_motor_set_position (motor3 ,inf);
wb_motor_set_velocity (motor3 ,2);  
wb_motor_set_position (motor4 ,inf);
wb_motor_set_velocity (motor4 ,2);
wb_motor_set_position (motor5 ,inf);
wb_motor_set_velocity (motor5 ,2);
wb_motor_set_position (motor6 ,inf);
wb_motor_set_velocity (motor6 ,2);





wb_lidar_enable_point_cloud(Lidar)
wb_lidar_enable(Lidar, TIME_STEP);

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
while wb_robot_step(TIME_STEP) ~= -1


Lidar_data = wb_lidar_get_range_image(Lidar);


display(Lidar_data)





























  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.
