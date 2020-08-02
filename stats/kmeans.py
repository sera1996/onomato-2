import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
from sklearn.decomposition import PCA
import matplotlib as mpl
import matplotlib.pyplot as plt

clust_df = pd.read_csv("./total_avg_kmeans.csv")
label = clust_df['オノマトペ']
del(clust_df['オノマトペ'])
#print(clust_df)

clust_array = np.array([clust_df['粘性感'].tolist(),
                        clust_df['摩擦感'].tolist(),
                        clust_df['凸凹感'].tolist(),
                        clust_df['好感度'].tolist(),
                        clust_df['弾力'].tolist(),
                        clust_df['湿り気'].tolist(),
                        clust_df['硬さ'].tolist()
                        ],np.int32)

clust_array = clust_array.T

pred = KMeans(n_clusters=5).fit_predict(clust_array)
print(pred)

#clust_df['cluster_id']=pred
#print(clust_df['cluster_id'].value_counts())
#print(clust_df[clust_df['cluster_id']==0].mean())
#print(clust_df[clust_df['cluster_id']==1].mean())
#print(clust_df[clust_df['cluster_id']==2].mean())
#print(clust_df[clust_df['cluster_id']==3].mean())
#print(clust_df[clust_df['cluster_id']==4].mean())

#print(clust_df['cluster_id'])

color_codes = {0:'#00FF00', 1:'#FF0000', 2:'#0000FF', 3:'#FD7166', 4:'#364286'}
colors = [color_codes[x] for x in pred]
pca = PCA(n_components=2)
pca.fit(clust_df)
#print(pca.components_)

feature = pca.transform(clust_df)
#print(feature[:,0])

plt.figure(figsize=(6, 6))
for x, y, name in zip(feature[:, 0], feature[:, 1], clust_df.iloc[:, 0]):
    plt.text(x, y, name, alpha=0.8, size=10)
plt.scatter(feature[:, 0], feature[:, 1], alpha=0.8, color=colors)
plt.title("Principal Component Analysis")
plt.xlabel("The first principal component score")
plt.ylabel("The second principal component score")
plt.show()