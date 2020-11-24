[idx,w]=relieff(table2array(datasetnormt8p8(:,1:92)),table2array(datasetnormt8p8(:,93)),10)

Rank=datasetnormt8p8.Properties.VariableNames(idx(1:92));


bar(w(idx))
xlabel('Predictor rank')
ylabel('Predictor importance weight')
xticks(1:92);
xticklabels(datasetnormt8p8.Properties.VariableNames(idx(1:92)))

set(gca,'XTickLabelRotation',90)