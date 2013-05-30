
def rec_intersection(rect1, rect2)

  rectArr1 = [ (rect1[0][0] .. rect1[1][0]).to_a , 
	 (rect1[0][1] .. rect1[1][1]).to_a ]

	rectArr2 = [ (rect2[0][0] .. rect2[1][0]).to_a , 
	 (rect2[0][1] .. rect2[1][1]).to_a ]

	xSegment = overlap(rectArr1[0],rectArr2[0])

	if xSegment != nil
		ySegment = overlap(rectArr1[1],rectArr2[1])

		if ySegment != nil
			return [ [xSegment[0], ySegment[0]], [xSegment[1], ySegment[1]] ]
		end
	end

	return nil

end

def overlap(rect1XorY,rect2XorY)
	leftOrBottom = nil
	rightOrTop = nil

	if rect1XorY[0] <= rect2XorY[0]
		leftRect = rect1XorY
		otherRect = rect2XorY
	else
		leftRect = rect2XorY
		otherRect = rect1XorY
	end

	for point in leftRect

		if leftOrBottom != nil

			if not otherRect.include? point + 1 or not leftRect.include? point + 1

				rightOrTop = point
				break
			end
		else
			if otherRect.include? point and otherRect.include? point+1
				leftOrBottom = point
			elsif point == leftRect[-2]
				return nil

			end
		end
	end

	return [leftOrBottom,rightOrTop]
end
