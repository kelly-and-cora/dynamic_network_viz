#Community Detection
    #see 

time1_graph <- as.undirected(graph_from_adjacency_matrix(as.matrix(time1)))

fastgreedy <- fastgreedy.community(time1_graph) #hierarchical bottomup community detection approach.  Initially, every vertex belongs to a separate community, and communities are merged iteratively such that each merge is locally optimal
louvain <- cluster_louvain(time1_graph) #hierarchical community detection approach. see http://arxiv.org/abs/arXiv:0803.0476


## PLOTS
plot.igraph(louvain)
plot(time1_graph)
