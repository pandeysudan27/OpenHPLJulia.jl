function intake(Hn, Vdotn; method="Bier",eta_nominal=0.9,pipe_roughness=0.05)
    return basic_pipe(Hn, Vdotn; unit="intake")
end
function penstock(Hn, Vdotn; method="Bier",eta_nominal=0.9,pipe_roughness=0.05)
    return basic_pipe(Hn, Vdotn; unit="penstock")
end
function surgetank(Hn, Vdotn; method="Bier",eta_nominal=0.9,pipe_roughness=0.05,)
    return basic_pipe(Hn, Vdotn; unit="surgetank")
end
function pipe(Hn, Vdotn; method="Bier",eta_nominal=0.9,pipe_roughness=0.05,)
    return basic_pipe(Hn, Vdotn; unit="pipe")
end
