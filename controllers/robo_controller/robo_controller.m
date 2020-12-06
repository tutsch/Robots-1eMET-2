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
fA = wb_robot_get_device('grabber finger A sensor');
fB = wb_robot_get_device('grabber finger B sensor');
fC = wb_robot_get_device('grabber finger C sensor');


pozice(1.54, 1.45);
fingers(0.7, 0.7, 0.7);

wb_motor_set_velocity(finger_a, 0.5);
wb_motor_set_velocity(finger_b, 0.5);
wb_motor_set_velocity(finger_c, 0.5);
wb_motor_set_velocity(pivot, 0.3);
wb_motor_set_velocity(twister, 0.5);



wb_distance_sensor_enable(ds, TIME_STEP);
wb_position_sensor_enable(ps, TIME_STEP);
wb_position_sensor_enable(tw, TIME_STEP);
wb_position_sensor_enable(fA, TIME_STEP);
wb_position_sensor_enable(fB, TIME_STEP);
wb_position_sensor_enable(fC, TIME_STEP);




while wb_robot_step(TIME_STEP) ~= -1

  distance = wb_distance_sensor_get_value(ds);
  pivot_sensor = wb_position_sensor_get_value(ps);
  twister_sensor = wb_position_sensor_get_value(tw);
  sensorA = wb_position_sensor_get_value(fA);
  sensorB = wb_position_sensor_get_value(fB);
  sensorC = wb_position_sensor_get_value(fC);
  
  %disp(distance);
  %disp(pivot_sensor);

  if pivot_sensor > 1.44
    fingers(0.35, 0.35, 0.35);
    if sensorA < 0.37 && sensorB < 0.37 && sensorC < 0.37
      if distance < 20 && distance > 5
        pozice(0, -0.01);
      end
      if distance < 50 && distance > 20
        pozice(-0.5, -0.01);
      end
    end
  end
  if pivot_sensor < 0
    fingers(0.23, 0.7, 0.7);
  end


  drawnow;

end
   
  function pozice(twis, piv)
    global pivot
    global twister
    wb_motor_set_position(twister, twis);
    wb_motor_set_position(pivot, piv);
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
