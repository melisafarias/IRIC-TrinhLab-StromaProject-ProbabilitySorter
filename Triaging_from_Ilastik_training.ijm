

macro "Pixel Counter" {
    // Specify the shade you want to count (0-255)
    colorToCount = 254;

    // Get the active image
    
    sourceDirectory = "C:/Users/p0832974/Desktop/Ilastik_Training/Pancreatitis+Cancer";
    File_List= getFileList(sourceDirectory);
	specificName = "Simple Segmentation";
	List_count = File_List.length;
	print(File_List.length);
	Original_And_Simple_Segmentation_List = newArray(List_count);
	number = 0; 
	/*
  	for (i = 0; i < File_List.length; i++) {
	    // Check if the file is not a directory and its name contains the specific name
	    open(sourceDirectory + "/" + File_List[i]);
	    if (getTitle().contains(specificName)) {
	    	open(sourceDirectory + "/" + File_List[i - 1]);
	    	Original_And_Simple_Segmentation_List[number] = getTitle();
	    	number++;
	    	close();
	        Original_And_Simple_Segmentation_List[number] = getTitle();
	    	number++;
	    	print(number);
	    }
    	close();
    }
    */
    tileCounter = number;
    //find + open set image 
    for(tile = 0; tile < File_List.length ;tile++){
    	print(tile);
    	//print(Original_And_Simple_Segmentation_List[tile]);
    	//print(File_List[tile]);
    	
	    //print(sourceDirectory + "/" + Original_And_Simple_Segmentation_List[tile]);
	    //open(sourceDirectory + "/" + Original_And_Simple_Segmentation_List[tile]);
	    //print(sourceDirectory + "/" + File_List[tile]);
	    open(sourceDirectory + "/" + File_List[tile]);
	    getDimensions(width, height, channels, slices, frames);
	
	    // Count the number of pixels with the specified shade
	    count = 0;
	    for (y = 0; y <= height; y++) {
	        for (x = 0; x <= width; x++) {
	            value = getPixel(x, y);
	            //print(value);
	            if (value == colorToCount) {
	                count++;
	            }
	        }
	    }
		//print(count);
	  	if (count >= 47667 ) {
		    // Specify the source and destination file paths
		    //open(sourceDirectory + "/" + Original_And_Simple_Segmentation_List[tile - 1]);
		    open(sourceDirectory + "/" + File_List[tile - 1]);
		    sourcePath = "C:/Users/p0832974/Desktop/Ilastik_Training/Pancreatitis+Cancer" + "/" + getTitle();
		    destinationPath = "C:/Users/p0832974/Desktop/Ilastik_Training/Original Stroma" + "/" + getTitle();
		     File.rename(sourcePath, destinationPath);
		    // print(sourcePath);
		    //destinationPath = "C:/Users/p0832974/Desktop/Ilastik_Training/Stroma" + "/" + getTitle();
		    // print(destinationPath);
		    // Move the file
		   
		    close();
		    sourcePath = "C:/Users/p0832974/Desktop/Ilastik_Training/Pancreatitis+Cancer" + "/" + getTitle();
		    destinationPath = "C:/Users/p0832974/Desktop/Ilastik_Training/Simple Segmentation Stroma" + "/" + getTitle();
		    File.rename(sourcePath, destinationPath);
		    // Check if the move operation was successful
		    if (File.exists(destinationPath)) {
		        print("File moved successfully.");
		    } else {
		        print("Failed to move the file.");
		    }
		}
		close();
	}


}

