local prototype = {
    new = function(self, x, y)
        return {x=x, y=y}
    end,
    __add = function(self, rhs)
        return Vector(self.x + rhs.x, self.y + rhs.y)
    end,
    __sub = function(self, rhs)
        return Vector(self.x - rhs.x, self.y - rhs.y)
    end,
    __mul = function(self, rhs)
        return Vector(self.x * rhs.x, self.y * rhs.y)
    end,
    __div = function(self, rhs)
        return Vector(self.x / rhs.x, self.y / rhs.y)
    end,
}

local Vector = function(x, y)
    local obj = prototype:new(x, y)
    setmetatable(obj, prototype)
    return obj
end

return Vector