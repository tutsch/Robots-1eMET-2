%desktop;
%keyboard;

TIME_STEP = 64;

global twister;
twister = wb_robot_get_device('twister');
global pivot;
pivot = wb_robot_get_device('pivot');
global finger_a;
finger_a = wb_robot_get_device('grabber finger A');
global finger_b;
finger_b = wb_robot_get_device('grabber finger B');
global finger_c;
finger_c = wb_robot_get_device('grabber finger C');


ds = wb_robot_get_device('ds');
ps = wb_robot_get_device('pivot sensor');
tw = wb_robot_get_device('twister sensor');



pozice(1.54, 1.45, 0.7, 0.7, 0.7);

wb_motor_set_velocity(finger_a, 0.5);
wb_motor_set_velocity(finger_b, 0.5);
wb_motor_set_velocity(finger_c, 0.5);
wb_motor_set_velocity(pivot, 0.3);
wb_motor_set_velocity(twister, 0.5);



wb_distance_sensor_enable(ds, TIME_STEP);
wb_position_sensor_enable(ps, TIME_STEP);




while wb_robot_step(TIME_STEP) ~= -1

  distance = wb_distance_sensor_get_value(ds);
  pivot_sensor = wb_position_sensor_get_value(ps);
  %disp(distance);
  %disp(pivot_sensor);

  if distance < 600 
    if pivot_sensor > 1.44
      
      fingers(1, 1, 1);
      %pozice(0.5, 0.3, 0.5, 0.5, 0.5);
      %wb_motor_set_position(finger_a, 0.565);
      %wb_motor_set_position(finger_b, 0.7);
      %wb_motor_set_position(finger_c, 0.7);
      %wb_motor_set_position(pivot, 0);
      %wb_motor_set_position(twister, 0);
      
      %wb_motor_set_velocity(finger_a, 0.5);
      %wb_motor_set_velocity(finger_b, 0.5);
      %wb_motor_set_velocity(finger_c, 0.5);
      %wb_motor_set_velocity(pivot, 0.3);
      %wb_motor_set_velocity(twister, 0.5);
    end
  end

  drawnow;


end
  
  
  % twister = wb_robot_get_device('twister');
  % pivot = wb_robot_get_device('pivot');
  % finger_a = wb_robot_get_device('grabber finger A');
  % finger_b = wb_robot_get_device('grabber finger B');
  % finger_c = wb_robot_get_device('grabber finger C');
  function pozice(twis, piv)
    global pivot
    global twister
    % global finger_a 
    % global finger_b 
    % global finger_c 
    wb_motor_set_position(pivot, piv);
    wb_motor_set_position(twister, twis);
    % wb_motor_set_position(finger_a, fingA);
    % wb_motor_set_position(finger_b, fingB);
    % wb_motor_set_position(finger_c, fingC);
  end  
  
  function fingers(fingA, fingB, fingC)
    global finger_a 
    global finger_b 
    global finger_c 
    wb_motor_set_position(finger_a, fingA);
    wb_motor_set_position(finger_b, fingB);
    wb_motor_set_position(finger_c, fingC);
  end
% cleanup code goes here: write data to files, etc.
