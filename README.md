# almawaukh-integrals

## to-be-done
https://math.stackexchange.com/questions/tagged/integration?tab=votes&page=2&pagesize=50 (and next pages)

\textbf{Problem \ref{stack_562694}} -- podstawiamy $y = (1+x) / (1-y)$ i mamy
\begin{align}
    I & = 2 \int_{-1}^1 \frac{\log y^2}{1-y^2} \,\mathrm{d}y \\
        & = 8 \int_0^1 \frac{\log y}{1-y^2} \, \mathrm{d}{y} \\
        & = 8 \sum_{k=0}^\infty \int_0^1 y^{2k} \log y \,\mathrm{d} y \\
        & = 8 \sum_{k=0}^\infty \frac{1}{(2k+1)^2} \\
        & = 8 \cdot \frac{\pi^2}{8} = 8.
\end{align}