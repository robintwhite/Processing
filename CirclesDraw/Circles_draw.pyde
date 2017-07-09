#Creates circle packing to re-create image given at input.
#Created by Robin White

import random

circles = []
spots = []

def setup():
    size(754, 616)
    global img
    img = loadImage('walle_big.png')#('walle_thresh.png')
    img.loadPixels()
    global attempts
    #For thresholded black and white image
    # for x in range(img.width):
    #     for y in range(img.height):
    #         index = int(x + y * img.width)
    #         col = img.pixels[index]
    #         b = brightness(col)
    #         if (b < 1):
    #             spots.append(PVector(x,y))
                
    #println(len(spots))
    
def draw():
    if (len(circles) > 8000):
        save('walle_packing.tif')
        println('FINISHED')
        noLoop()
            
    background(0)
    #frameRate(5)
    count = 25
    attempts = 0
    for i in range(count):
        if (attempts < 1):
            newCircle(attempts)
        else:
            save('walle_packing.tif')
            println('FINISHED')
            noLoop()
            
    for c in circles:
        if c.growing:
            if (c.edges()):
                c.growing = False
            else:
                for other in circles:
                    if c != other:
                        d = dist(c.x, c.y, other.x, other.y)
                        if (d - 2 < c.r + other.r):
                            c.growing = False
                            break
        c.display()
        c.grow()    

class circle(object):
    def __init__(self, x_, y_, col_):
        self.x = x_
        self.y = y_
        self.r = 2
        self.col = col_
        self.growing = True
        
    def grow(self):
        if self.growing:
            self.r = self.r + 0.5
        
    def edges(self):
        return (self.x + self.r > width) or (self.x - self.r < 0) or (self.y + self.r > height) or (self.y - self.r < 0)
        
        
    def display(self):
        # noFill()
        # stroke(255)
        # strokeWeight(2)
        colorMode(HSB,255)
        noStroke()
        #c2 = map(self.col, 0 , width*height - 1, 0, 255)
        fill(self.col) #(c2,c2,100) 
        ellipse(self.x, self.y, self.r*2, self.r*2)
        
def newCircle(attempts):
    #r = random.randint(0,len(spots))
    x = random.randint(0,width-1) #spots[r].x
    y = random.randint(0,height-1) #spots[r].y
    valid = True
    
    for c in circles:
        d = dist(x, y, c.x, c.y)
        if d < c.r + 2:
            valid = False
            break
        
    if valid:
        index = int(x + y*img.width)
        circles.append(circle(x,y,img.pixels[index])) 
    else:
        attempts += attempts + 1
        return attempts
