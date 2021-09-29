function largest = largestOfThree(a, b, c)

largest = a;

if (largest < b)
    largest = b;
end

if (largest < c)
    largest = c;
end

end