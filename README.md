## Алгоритм ближайшего соседа

Алгоритм ближайшего соседа(nearest neighbor, NN) относит классифицируемыйобъект u ∈ Xℓ к тому классу, которому принадлежит ближайший обучающий объект: w(i,u) = [i= 1]; a(u;Xℓ)=y(1)u.

Этот алгоритм является, по всей видимости, самым простым классификатором.Обучение NN сводится к запоминанию выборки Xℓ. Единственное достоинство этого алгоритма простота реализации.

Недостатков гораздо больше:

•Неустойчивость к погрешностям. Если среди обучающих объектов есть выброс объект, находящийся в окружении объектов чужого класса, то не толькоон сам будет классифицирован неверно, но и те окружающие его объекты, для которых он окажется ближайшим.
•Отсутствие параметров, которые можно было бы настраивать по выборке. Алгоритм полностью зависит от того, насколько удачно выбрана метрикаρ.

•В результате низкое качество классификации.


## Алгоритм k ближайших соседей (kNN).
метод kNN относит классифицируемый объект к тому классу, к которому принадлежит большая часть из ближайших k соседей.
kNN — один из простейших алгоритмов классификации, поэтому  он зачастую оказывается неэффективным. Помимо точности классификации, также проблемой  является скорость классификации:
если в обучающей выборке N объектов, в тестовой выборе M объектов, а размерность пространства — K, значит количество операций для классификации тестовой выборки может быть оценено как O(KMN).













