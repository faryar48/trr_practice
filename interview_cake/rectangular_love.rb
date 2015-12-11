# A crack team of love scientists from OkEros (a hot new dating site) have devised a way to represent dating profiles as rectangles on a two-dimensional plane.
# They need help writing an algorithm to find the intersection of two users' love rectangles. They suspect finding that intersection is the key to a matching algorithm so powerful it will cause an immediate acquisition by Google or Facebook or Obama or something.

# It must
# be love
# Write a function to find the rectangular intersection of two given love rectangles.

# As with the example above, love rectangles are always "straight" and never "diagonal." More rigorously: each side is parallel with either the x-axis or the y-axis.

# They are defined as hashes ↴ like this:

#   my_rectangle = {

#     # coordinates of bottom-left corner:
#     'x' => 1,
#     'y' => 5,

#     # width and height
#     'width' => 10,
#     'height' => 4,

# }

# Your output rectangle should use this format as well.

def find_range_overlap(point1, length1, point2, length2)
  higher_start_point = [point1, point2].max

  lower_end_point = [point1 + length1, point2 + length2].min

  return [nil, nil] if higher_start_point >= lower_end_point

  overlap_length = lower_end_point - higher_start_point

  return [higher_start_point, overlap_length]

end


def find_rectangular_overlap(rect1, rect2)
  x_point, overlap_width = find_range_overlap(rect1['x'], rect1['width'], rect2['x'], rect2['width'])
  y_point, overlap_height = find_range_overlap(rect1['y'], rect1['width'], rect2['y'], rect2['width'])

  return none if (!overlap_width || !overlap_height)

  return {
    'x' => x_point,
    'y' => y_point,
    'width' => overlap_width,
    'height' => overlap_height
  }

end

my_rectangle1 = {
  'x' => 1,
  'y' => 5,
  'width' => 15,
  'height' => 6,
}

my_rectangle2 = {
  'x' => 2,
  'y' => 7,
  'width' => 10,
  'height' => 4,
}

p find_rectangular_overlap(my_rectangle1, my_rectangle2)
