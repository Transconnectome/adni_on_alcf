function group_connectome
list_subject=importdata('list_subject');
ATLAS={'aparc+aseg','aparc.a2009s+aseg'};
ESTIMATE={'count','length'};


for a=1:length(ATLAS)
    for e=1:length(ESTIMATE)
        TMP=[];
        for s=1:length(list_subject)
            name=[list_subject{s} '_1mm_flair_mr_connectome_sift_10M_' ATLAS{a} '_upsample125_' ESTIMATE{e} '.csv'];
            tmp=dlmread(name);
            [aa,bb]=size(tmp);
            tmp=reshape(tmp,[aa*bb,1]);
            TMP=[TMP; tmp];

        end
        filename=['Connectome_group_' ATLAS{a} '_upsample125_' ESTIMATE{e} ];
        [aa,bb]=size(tmp)
        TMP=reshape(TMP,[sqrt(aa),sqrt(aa),length(list_subject)]);
        save(filename, 'TMP')
    end
end
