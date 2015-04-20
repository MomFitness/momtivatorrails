# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def row_to_hash(keys, row)
  Hash[*keys.zip(row).flatten]
end

print("\nCreating default Equipment: ")
columns = [:id, :desc]
[
  [1,'Chair'], [2,'Dumbells']
].each do | row |
  unless Equipment.find_by_id(row.first)
    print "c"
    unless (x = Equipment.new(row_to_hash(columns, row))).save
      puts("Error on row #{row.first}: #{x.errors.full_messages.join(", ")}")
      puts x.inspect
    end
  else
    print "."
  end
end
  

print("\nCreating default Exercise: ")
columns = ['id', 'user_id', 'type_id', 'name', 'goal_id', 'focus']
[ 
  [1,1,1,'Jumping Jacks',1,''],
  [2,1,1,'Jump Rope',1,''],
  [3,1,1,'High Knees',1,''],
  [4,1,1,'Jogging',1,''],
  [5,1,3,'Jogging - IT',1,'Heart'],
  [6,1,3,'Pushups',3,'Shoulders'],
  [7,1,3,'Leg Lifts',3,'Outer Thighs'],
  [8,1,3,'Chair Dips',3,'Triceps'],
  [9,1,3,'Chest Press with dumbells',3,'Chest'],
  [10,1,3,'Walking Lunges',3,'Thighs'],
  [11,1,3,'Triceps Extensions',3,'Triceps'],
  [12,1,4,'Break',nil,'Rest'],
  [13,1,5,'SEQUENCE REPEATOR',nil,'Indicates that sequences of workout ids needs to be repeated'],
  [14,1,3,'Double Crunch',4,'Lower Abs'],
  [15,1,3,'Twisting Bicycle',4,'Abs'],
  [16,1,3,'Leg Lifts',4,'Abs'],
  [17,1,3,'Plank',4,'Abs, Arms'],
  [18,1,3,'Dumbell Rows',3,'Arms'],
  [19,1,3,'Squats',3,'Butt'],
  [20,1,3,'Biscep Curls',3,'Arms: Bisceps'],
  [21,1,3,'Reverse Flye',3,'Arms'],
  [22,1,3,'Step-Ups',3,'Butt'],
  [23,1,3,'Lateral Shoulder Raise',3,'Shoulder']
].each do | row |
  unless Exercise.find_by_id(row.first)
    print "c"
    unless (x = Exercise.new(row_to_hash(columns, row))).save
      puts("Error on row #{row.first}: #{x.errors.full_messages.join(", ")}")
      puts x.inspect
    end
  else
    print "."
  end
end

print("\nCreating default Goals: ")
columns = ['id', 'desc', 'goal_type_id']
[ 
  [1,'Raise heart rate',6],
  [2,'Break sweat',6],
  [3,'Muscle Strength',6],
  [4,'Core Strength',6],
  [5,'Sore',7]
].each do | row |
  unless Goal.find_by_id(row.first)
    print "c"
    unless (x = Goal.new(row_to_hash(columns, row))).save
      puts("Error on row #{row.first}: #{x.errors.full_messages.join(", ")}")
      puts x.inspect
    end
  else
    print "."
  end
end

print("\nCreating default Mistake: ")
columns = ['id', 'exercise_id', 'desc', 'advise']
[ 
  [1,10,'Leaning forward','Remember to keep the weight on your heels so you\'re not leaning forward'],
  [2,14,'Strain your neck','Ask Lena'],
  [3,21,'form','Keep your arms slightly rounded by pretending that you\'re hugging a tree']
].each do | row |
  unless Mistake.find_by_id(row.first)
    print "c"
    unless (x = Mistake.new(row_to_hash(columns, row))).save
      puts("Error on row #{row.first}: #{x.errors.full_messages.join(", ")}")
      puts x.inspect
    end
  else
    print "."
  end
end

print("\nCreating default Modification: ")
columns = ['id', 'exercise_id', 'level_type', 'desc']
[ 
  [1,10,'ADV','Go deep by twisting into the leading leg and touching the ground with opposite hand'],
  [2,21,'BEG','Bend near elbows or use lower weights']
].each do | row |
  unless Modification.find_by_id(row.first)
    print "c"
    unless (x = Modification.new(row_to_hash(columns, row))).save
      puts("Error on row #{row.first}: #{x.errors.full_messages.join(", ")}")
      puts x.inspect
    end
  else
    print "."
  end
end

print("\nCreating default Profile: ")
columns = ['id', 'user_id', 'first_name', 'last_name', 'address', 'years_of_exprience']
[ 
  [1,1,'John','Doe','123 Market St. San Francisco', 12]
].each do | row |
  unless Profile.find_by_id(row.first)
    print "c"
    unless (x = Profile.new(row_to_hash(columns, row))).save
      puts("Error on row #{row.first}: #{x.errors.full_messages.join(", ")}")
      puts x.inspect
    end
  else
    print "."
  end
end

print("\nCreating default RepeatSequence: ")
columns = ['id', 'start_sequence_id', 'end_sequence_id', 'reps']
[ 
	[1,8,10,2],
	[2,36,40,3],
	[3,3,6,2],
	[4,28,31,5],
	[5,23,25,4],
	[6,15,19,2]
].each do | row |
  unless RepeatSequence.find_by_id(row.first)
    print "c"
    unless (x = RepeatSequence.new(row_to_hash(columns, row))).save
      puts("Error on row #{row.first}: #{x.errors.full_messages.join(", ")}")
      puts x.inspect
    end
  else
    print "."
  end
end

print("\nCreating default RequiredTool: ")
columns = ['id', 'exercise_id', 'equipment_id']
[ 
  [1,8,1],
  [2,11,2],
  [3,20,2],
  [4,21,2],
  [5,23,2]
].each do | row |
  unless RequiredTool.find_by_id(row.first)
    print "c"
    unless (x = RequiredTool.new(row_to_hash(columns, row))).save
      puts("Error on row #{row.first}: #{x.errors.full_messages.join(", ")}")
      puts x.inspect
    end
  else
    print "."
  end
end

print("\nCreating default Restriction: ")
columns = ['id', 'min_reps', 'max_reps', 'min_time', 'max_time', 'exercise_id']
[ 
  [1,nil,nil,3,5,5],
  [2,8,24,0,0,6]
].each do | row |
  unless Restriction.find_by_id(row.first)
    print "c"
    unless (x = Restriction.new(row_to_hash(columns, row))).save
      puts("Error on row #{row.first}: #{x.errors.full_messages.join(", ")}")
      puts x.inspect
    end
  else
    print "."
  end
end

print("\nCreating default Sequence: ")
columns = ['id', 'exercise_id', 'workout_id', 'order', 'repeats', 'duration', 'repeat_sequence_id']
[ 
  [1,4,1,1,0,120,nil],
  [2,5,1,2,0,240,nil],
  [3,6,1,3,20,0,nil],
  [4,7,1,4,20,0,nil],
  [5,7,1,5,20,0,nil],
  [6,8,1,6,20,0,nil],
  [7,2,1,8,0,420,nil],
  [8,9,1,9,20,0,nil],
  [9,10,1,10,20,0,nil],
  [10,11,1,11,20,0,nil],
  [11,12,1,12,0,30,nil],
  [12,13,1,7,0,0,3],
  [13,13,1,13,0,0,1],
  [14,5,1,14,0,420,nil],
  [15,14,1,15,20,0,nil],
  [16,15,1,16,20,0,nil],
  [17,16,1,17,20,0,nil],
  [18,16,1,17,20,0,nil],
  [19,17,1,18,0,30,nil],
  [20,13,1,19,0,0,6],
  [21,4,2,1,0,120,nil],
  [22,5,2,2,0,240,nil],
  [23,18,2,3,20,0,nil],
  [24,19,2,4,20,0,nil],
  [25,20,2,5,20,0,nil],
  [26,13,2,6,0,0,5],
  [27,2,2,7,0,420,nil],
  [28,21,2,8,20,0,nil],
  [29,22,2,9,20,0,nil],
  [30,22,2,10,20,0,nil],
  [31,23,2,11,20,0,nil],
  [32,13,2,12,0,0,4],
  [34,5,2,13,0,420,nil],
  [36,14,2,15,20,0,nil],
  [37,15,2,16,20,0,nil],
  [38,16,2,17,20,0,nil],
  [39,16,2,17,20,0,nil],
  [40,17,2,18,0,30,nil],
  [41,13,2,19,0,0,2]
].each do | row |
  unless Sequence.find_by_id(row.first)
    print "c"
    unless (x = Sequence.new(row_to_hash(columns, row))).save
      puts("Error on row #{row.first}: #{x.errors.full_messages.join(", ")}")
      puts x.inspect
    end
  else
    print "."
  end
end

print("\nCreating default Type: ")
columns = ['id', 'desc']
[ 
  [1,'Warm up'],
  [2,'Cool down'],
  [3,'Main Workout'],
  [4,'Break'],
  [5,'META: Sequence Repeator']
].each do | row |
  unless Type.find_by_id(row.first)
    print "c"
    unless (x = Type.new(row_to_hash(columns, row))).save
      puts("Error on row #{row.first}: #{x.errors.full_messages.join(", ")}")
      puts x.inspect
    end
  else
    print "."
  end
end

print("\nCreating default User: ")
columns = ['id', 'email', 'password', 'role','reset_password_token', 'reset_password_sent_at',
           'remember_created_at', 'sign_in_count', 'current_sign_in_at', 'last_sign_in_at',
           'current_sign_in_ip', 'last_sign_in_ip', 'created_at', 'updated_at']
[ 
  [1,'trainer1@x.com','testing123','Trainer',nil,nil,nil,1,
    '2015-01-19 22:43:22','2015-01-19 22:43:22','127.0.0.1','127.0.0.1','2015-01-19 22:43:22','2015-01-19 22:43:22'],
  [2,'mom1@x.com','testing123','Mom',nil,nil,nil,1,
    '2015-01-19 22:43:49','2015-01-19 22:43:49','127.0.0.1','127.0.0.1','2015-01-19 22:43:49','2015-01-19 22:43:49'],
  [3,'admin1@x.com','testing123','Admin',nil,nil,nil,0,nil,nil,nil,nil,nil,nil],
  [4,'super_user@x.com','testing123','Admin',nil,nil,nil,0,nil,nil,nil,nil,nil,nil]
].each do | row |
  unless User.find_by_id(row.first)
    print "c"
    unless (x = User.new(row_to_hash(columns, row))).save
      puts("Error on row #{row.first}: #{x.errors.full_messages.join(", ")}")
      puts x.inspect
    end
  else
    print "."
  end
end

print("\nCreating default Workout: ")
columns = ['id', 'name', 'mom_id', 'trainer_id', 'timer',
           'status', 'start', 'end', 'focus',
           'feedback_id', 'goal_id', 'workout_date', 'workout_schedule_time']
[ 
  [1,'Fitness Magazine Workout 1',2,1,0,0,nil,nil,'Whole Body',0,nil,1.month.ago,nil],
  [2,'Fitness Magazine Workout 2',2,1,0,0,nil,nil,'Whole Body',0,nil,Date.today,nil]
].each do | row |
  unless Workout.find_by_id(row.first)
    print "c"
    unless (x = Workout.new(row_to_hash(columns, row))).save
      puts("Error on row #{row.first}: #{x.errors.full_messages.join(", ")}")
      puts x.inspect
    end
  else
    print "."
  end
end
print("\nAll Done \n")