function TrainOut = KNN_PCA_Train(directory, path='Classifiers/')
	
	% Add pathes of needed functions
	addpath([path 'Functions']);
	addpath([path 'RawDataFunctions']);
        
	% Get Raw Data from the file 
	[data, HDR] = getRawData(directory);
        
	% Intial values
	classes_no = [ getClassNumber(HDR,'RIGHT')  getClassNumber(HDR,'LEFT') ];
        
	% do pre-processing here please 
	noise = mean(data')';
	data =  data -noise;	
	
	% Get features (mu & beta)
	[Mu,Beta] =  GetMuBeta(data, HDR);
        
	% apply LDA method to the features
	%X = [Mu Beta];
	%[Z, V]  = LDA_fn(HDR.Classlabel, X, classes_no);
        
	%apply PCA method to features
	pureData = [Mu, Beta];
	[V, Z]= pcaProject(pureData);
	size(V)%28*28
	size(Z)%28*100
	% Get the classifier parameters here

	[accuracy k_total] = knnResults(Z', HDR.Classlabel);
	[AccSelected, AccIndex] = max(accuracy)
	PC_Num = min(AccIndex)
	K = k_total(PC_Num)
	% Returing output structure
	
	TrainOut.K = K;
	TrainOut.Ztrain = Z;
	TrainOut.V = V;
	TrainOut.PC_Num = PC_Num;
        TrainOut.ClassLabels = HDR.Classlabel;
end
