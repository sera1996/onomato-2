import MeCab
from gensim.models import word2vec
import numpy as np
import sys
args = sys.argv
mt = MeCab.Tagger('')
mt.parse('')
model = word2vec.Word2Vec.load("./wiki.model")

# テキストのベクトルを計算
def get_vector(text):
    sum_vec = np.zeros(200)
    word_count = 0
    node = mt.parseToNode(text)
    while node:
        fields = node.feature.split(",")
        # 名詞、動詞、形容詞に限定
        if fields[0] == '名詞' or fields[0] == '動詞' or fields[0] == '形容詞' or fields[0] == "副詞":
            sum_vec += model.wv[node.surface]
            word_count += 1
        node = node.next

    return sum_vec / word_count


# cos類似度を計算
def cos_sim(v1, v2):
    return np.dot(v1, v2) / (np.linalg.norm(v1) * np.linalg.norm(v2))


if __name__ == "__main__":
    v1 = get_vector(args[1])
    v2 = get_vector(args[2])
    #v3 = get_vector('ねちゃねちゃ')

    print(cos_sim(v1, v2))
    #print(cos_sim(v1, v3))