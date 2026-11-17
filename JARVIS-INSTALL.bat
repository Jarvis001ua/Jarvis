@echo off
setlocal
set "WORK=%USERPROFILE%\Jarvis-Atmosphere"
set "B64=%TEMP%\jarvis_payload.b64"
set "ZIP=%TEMP%\jarvis_payload.zip"

echo === Jarvis Atmosphere Installer ===

where python >nul 2>nul
if errorlevel 1 goto nopython

echo [1/4] Unpacking program files...
if exist "%WORK%" rmdir /s /q "%WORK%"
mkdir "%WORK%" 2>nul
del "%B64%" "%ZIP%" 2>nul
>>"%B64%" echo UEsDBBQAAAAIALB5cV2QU4ULjwMAAO0HAAALAAAAaW5zdGFsbC5iYXSFVV1vKjcQ
>>"%B64%" echo fUfiP0xXqQApmJukT1RURQn3hluJIECK1NyrytmdZX1Z7K3tZeGlv71j70f4KGoe
>>"%B64%" echo EHjGZ84cz5z8jmGiQMVxu2XQpirkabsVRjCIIPj5nyj7FLRb7ZZPGo1G8JXrnTAw
>>"%B64%" echo tltlsgQ1whJtnrmYyxMxSGUB98JYCDT+nQuNW5TWMLu3AayVVZQRixTNefYPD/0X
>>"%B64%" echo b6DP09utwlfMDjZREn6TeQr37tMjodZKp7jDFO7qi2Vm08Db3eDhOzxq5FbINeyE
>>"%B64%" echo tjlPASV9U9LRZIy1WxV+fws7CgFzn1dKuFDMhZOMpykEPvfbMtQis+YbD63YcYvs
>>"%B64%" echo ndsPGd/uHYupNJauOB4RZigjlKFAA90tP4DlGwQOMRawFTK3aHpnzDKRgSghoN/P
>>"%B64%" echo s7XmEbpTSjoOaTh/hCud0K2ykZrlw4lWEZqNVRmYRGkb5pVQqkBtEnSFZmqu/UNB
>>"%B64%" echo /1Ftt1zS/NxEo7fJh7jfh8MvaD+rNEI95zbpdp5K1E7v1xsz6s6w6L+8/8DQeozq
>>"%B64%" echo 62upJlu6Oj3mGeGyotHtflVC9h0a3ETQuRhPlspNp+fw2YrrNVqXOur4ya4Gbp0L
>>"%B64%" echo 90Adl/Oq9IbafSLBQqv0ocr0MSLrmQglR5eFfMqS77DbC65IXGt3rDM72q0nJfEn
>>"%B64%" echo qFuD4KJGAKHvPgIagoPKNVQClutX4WU8N0i/9sLC4B0+uVLDZol8tcli8bIYXoyG
>>"%B64%" echo 38ZY5fR2Euknca4GyQnEThmvEuKW8Ixm1wAtpjzOBYrpXEKs1Rams+X0aQI2Qfhz
>>"%B64%" echo Ogeuw0Ts8LbCUbq87cL+qh+ighsIVSZcr6SFin089rMDBjOuSYf0cMbpWRWOdCz2
>>"%B64%" echo w+oE4I6RsIVMFY8aCq4EazLuGSzEOrH9MBXhBki2PgSTvdW0vzCmhhgL6AirEyrA
>>"%B64%" echo KyYfGA8MXkgJWD2PVzXNLiGFSlpOwlxofXss122DQ38XPngLZACWLKDJ+oUY56eC
>>"%B64%" echo e6WtH/lrk3BXTULtisejMC+dpRmAulZlU3XcV0mszcxwMCiKgpVYTOn1IKpUNoPq
>>"%B64%" echo rvOAx+fJ4x9e93e1h2AcRTUUyTgfr54DiHLtHMa4/yO1ENZNhD5rka9Jyf/p7sOQ
>>"%B64%" echo j7v7TCc0SVSyXKD/tP4riI0xesDX8WI2nX0ZwlJtyW95uOFrcu24KVATpv0gC88y
>>"%B64%" echo cH5urCANCzKXa/t56g1npWpHcEvhXqhygXIITl2MyklqzG/GZaF/AVBLAwQUAAAA
>>"%B64%" echo CACweXFdY9uce3wBAAArAgAAEAAAAHJlcXVpcmVtZW50cy50eHRFkc1OwkAQx+99
>>"%B64%" echo ikm4QEgqggclgUR9AaLGu4EGGklLbEnsDWowMZB40MSLMXr2Uj4KhZaS8ASzr+CT
>>"%B64%" echo +N9VwmE7s52P339mM8QvnHLMqejDTnCWBCOd2QFPxPDPpSy+G/HIEeyaA47FCDal
>>"%B64%" echo n94r8ZhDXhDukRiQ6CE8RkMfNhQ+wQl5Jfqwqeq4lDkhz9EsyWkZqnmn3YZpk0oJ
>>"%B64%" echo AIyED/+ZVJMZUv9pZcItRgBiA07EEDj5X3aV7gS8HmIREDXPbdkWZUv6YSmfI06Q
>>"%B64%" echo Npd6AERNCNUo8sWIeKo4u+lRL9X3eMWRGk/FpiAHKBQPsguvd/3RvkgAxki+Np3u
>>"%B64%" echo TZvO83k665rtBl3ZdtvRtcuOYdRbF0bdblqma9pWtYKygtbxXNe5L1UrRf2koEld
>>"%B64%" echo 73LXQGBe2n7zG6Zc4SzEcBuXSQzUbteSDyRG2HCAX/L9QvVuUnyk1hhiYLmZZF+l
>>"%B64%" echo RIonWffBX9qt4d2ZVhP0I8X+VKD94wEsFRqOW60c6wXtF1BLAwQUAAAACACweXFd
>>"%B64%" echo f8scW+4BAAAxAwAACgAAAGluc3RhbGwuc2iNkstu00AUhvfzFKcmi1bINqi7tq5U
>>"%B64%" echo kYiboBFkgYRQNLGHetp4PB2PTaK2UlOxY1OpvAEPQIQIhELDKxy/EcdO2nJZ0M1c
>>"%B64%" echo zvWfb86tJT/PjN+TyheqgB7PYpYJC67IU9BSi9dc9lkYgdNYjqRRPBF0vOOsOIyJ
>>"%B64%" echo ME7BCYIA8EM5Kk9wjBc4w094jmPA9/gFx+UxXaflCPCU/D9wRnFvcULmMVCiw8I0
>>"%B64%" echo SbiKwC1AD22cqlXY9CNR+Crv9+HwEA5g3qZde2EVqMekWsb4DT/jBC+8v9tP6Ty5
>>"%B64%" echo KodTwJ+Vnawzalx7PWcdxEBauLsOR4xdxroJFBUGr1qZN99rODy0suBWMGICUmWW
>>"%B64%" echo kzzXzfWO4ZGoSIG7/6fTgBH7uTQiEcpmnh1Yxpqt54872+3AaRy8aN7vLq7d5sNn
>>"%B64%" echo a27jwfaTlt8U2Z5N9ZHDkj0CDq4m3os4wsUtbF4b/F1uCpm53CZppmNhhBfN8x3Y
>>"%B64%" echo 2KiC2MtFQWgpa4avWGeoRbCldV9SLZkq9pS+NHhU14GtqzrsHn0M6Q7++4+sNRBh
>>"%B64%" echo 0FjWb6IV/xrYHGlFdK6x+5vG3bSXEbydXLI2t/EimXWESaTi/cCaXNSoWBgnaQS3
>>"%B64%" echo Bzd68uVE4hnpO6lHYbYE+JFUfi/f4Tn880ooRxT2leaIZmcNbtLjF1BLAwQUAAAA
>>"%B64%" echo CACweXFduYoFDzoAAABEAAAACgAAAC5naXRpZ25vcmWLjy+oTE5MzkiNj9fn0tIr
>>"%B64%" echo qIxOzk+JBbJS09N1M/PS8vW59MpS88r0uSAkUEVJanFJPFgPkAsU5AIAUEsDBBQA
>>"%B64%" echo AAAIALB5cV0Ewr9UkAAAAO0AAAAOAAAAamFydmlzX2d1aS5iYXSFjsEKwjAQRO+B
>>"%B64%" echo /MMS8Jiq1578B68Fqe2m2dJmQzYN9eK3Sy2CJz0NzDBv5oKdZ2DntOp6OPZgDs8+
>>"%B64%" echo noxW5ABXkgymKhhKc+0SxSxNfGTPocIVDQycGbZ0N7XaFewMY5sKya3NM0v0mLAa
>>"%B64%" echo +S5g7bCQVu+io0Ditaq/CT/W/lLrD3H7nhKnCQtOcIbYLoJavQBQSwMEFAAAAAgA
>>"%B64%" echo sHlxXZU1jtetBwAAAhMAAAkAAABSRUFETUUubWSNWFtP3EYUfvevGIWXZbW7qOpT
>>"%B64%" echo t6qiqlcprVKFh6hPrFkccAr2dtebgoQqWEohIgoJjdQqSkLSPOQhDzULDmZvSPkF
>>"%B64%" echo 47/QX9LvnBmv7b3QIBHi8cy5n+984xkhn8h30o+2ZFuG0baQj6KW7MlBtB39JgMs
>>"%B64%" echo +4Yh/5AD2aU1/G3j90LgxDYecQLbA9mPWkL2pS9+2PBWXKcs6CDeX2LzOb2IHtOO
>>"%B64%" echo Dh570sfCWXQgcvXmnOXMFgQktyA3iPbwLqCNpymFPUOGItqRlyQT27rRIW96/xZi
>>"%B64%" echo s7bCsvfdWA1pbUHNv1tPyJwAboasvQd5LJtU3ifr4cchzOhBy3l0wOfhInadyzbW
>>"%B64%" echo OupQyTBmZoQ8Yp+gFgL7rLwlQ8MoCnkMNSFLbfEqIioDyG2z+h7rOGOj/YLgHWTh
>>"%B64%" echo TrRNh1/GFsLkUceig7LI5/H/gezQ/ny+QM8ktQvbOvEK27MXPdBPKqQBW9UnL/J5
>>"%B64%" echo 0vQ6CaVyXgZCR6NFkRO592+Hz7QlQFDnEG9ONQWWl2Y5QtmY4STOdZCjh9AczsH1
>>"%B64%" echo g+QxtTvagQAy5m8I63AsBrz5IpUrihayzcUkT6hKKDYneH0uKCE4iJxzWJBskvYP
>>"%B64%" echo CgtLmUoTXIUdiiJpEeSFCr6qhJAqN6Bc+6oH8NvimqQ87MCGUA6KUBvit0sPHIeO
>>"%B64%" echo qobXWlSfW6ND7VKpVBbNxopRs2vCdhqeuboqinVRt35u2nVrzXK8Rslb92gfeuvJ
>>"%B64%" echo 0MV0v0CWr+qS46Gi1xbfuO7yqgWDYRdXn6DUskdb5EXUKnLPBGx1P07vp2PhUl2h
>>"%B64%" echo igPhNH7Y+Ly5ZLsix138ne001wWXCUlqMz6E7HY3ekB6y6LSaC65wqx5Qx9rbt0z
>>"%B64%" echo ScpHnxSXrHuVWd0wf8KVSypbilkcnJlskytUSaU+N2rxrFFjbBHFNXHXrN+zGwum
>>"%B64%" echo t+Y2aitW3YIiobIyrZRyU+vmSsGiWPQs5IrsHSAUFJ10cdGjEhz9ToKpH6+Udy3d
>>"%B64%" echo H5la1717TdUFBU7hSU8hQEatYWwK+TRjxiYheSAvEuQRm9hVLBaF/hdPaM8M3BdY
>>"%B64%" echo KkWMVFDE9qgOr6PhN+Pe3GGMDFIwFos6muxJGpeUoFcIDpWiX1ZFFSL3XQjejx5j
>>"%B64%" echo ta80a8QpCHNt0UaTFIbwSzhAaHuWqH45FjeNUak3CV4qK451tcdGJ9inzEOMtfTj
>>"%B64%" echo tI3knLYt1vFqBBw3FXyfwlgABA8ixoIJY2ZS7LKwqFQcXQGcpG8SiI+Asdb0lDJB
>>"%B64%" echo IeSkXB/6kIwfnSQ9ywaYr1re2BiKZb7AixM9bjdVh7d5x34S1TRob6qChk7sQUZZ
>>"%B64%" echo 75YGS2OsS+YMIRYW1kzbWVgo1TaE+uEWR65VZNvRLnckjVLdetQko6Byyhg5Ag56
>>"%B64%" echo Pc0KoNF2PMbmoULSOAWXKTp9niCqpmjpgieNSNUXoVCPqqfLWn3CIUV6oM6serbr
>>"%B64%" echo ZNXxiUt2oZ+kNTPMuBr/P1NQUHWdO/ZySj75k9S6GnzE41qKOkFPiGONmmVVVxZs
>>"%B64%" echo p9b01OGZ8fGRm+ddt6yqu+zY5AjzOBQl5YJxNR4ViUi36cUyyZJ4dBF4xjMuB+z0
>>"%B64%" echo GusfT5fmWQ2vMScyPzMCx7BeHkuK5lwpXKSVuGBIx0lSqByAIfq+5Njscz/rVGBc
>>"%B64%" echo P1eZRCOPjIHPKPsErL4YhrRTHq2GIFUNNNArN7768fbNW1/OV4xcZbwPkpKsKLql
>>"%B64%" echo cKejD1vrVrXpWZPPJvWFSTzEYEp8knWf+aoPA4mxHrLQYdlU9Px+Rn1G0BY9oN6n
>>"%B64%" echo ZidGDKBB9+eYCfeZHWCIAHQZOwn++3AV09WQj+B6SwWLuDLTjm0Ktm4ZJl0dxcBY
>>"%B64%" echo MsVHNxOIg6JdONXndro1P19UoKc4HBLsawWnnCi+tVCKo0NDUxzFzkJOWVvoXHfj
>>"%B64%" echo Ba61jqJT6Y4AYgi6EtGI3Nfch5POqSBbO8wQ+zGZLBhDU84T0qM8GSIJOau43cNS
>>"%B64%" echo iixO5wylu+5iAyPcdarWECgGiuGpLqG+hJ2hRoU9rlZ27UPkmk3PHcrV9hcz1Cml
>>"%B64%" echo 4zLLOdvcmTtXcqhYT8PyPNtZbrCeMeSh2tNCe8xdfUryh8hdbtoiFZcpieQpmi5V
>>"%B64%" echo YD73epGuSs9HzcnnQXF/nSuN91XsRuluw3UqTKRh6xlD2Fix+AXAHzf8KUftYLRu
>>"%B64%" echo VPlNBwm8PIkeItnvFDlSQ4hnfFgYy0SqHLTqhLRNKk3gSE6+kW/KaPJn4Osci2OG
>>"%B64%" echo MZpBiIKIdhkn+tGhxgiWoVuBk5Z8Buhxo/WGZxgIQiI/Qr6Qr0TuJ2ujjtiVYdlt
>>"%B64%" echo 21lyf2mIL+rWEjDONlfF96ZjLlt18JM1s3pzXtywNqorIAFYmLeqdcvDH2SjahEW
>>"%B64%" echo knOKS7YxBon1ZICsM6FB9QHBIPOOSWVPZMIRACiPiDj6qAJgWLSrznAJkRBqsl2h
>>"%B64%" echo rlo6XG9GEIaCNoowamYnkUzj7cQiW6qbdzDmAMFwk9hWzPY0q0yk+1zZ7BjYdI8r
>>"%B64%" echo gE3ny3IbikFM1UUlRS5SNnDZqWoLFLyVRz4KkQ2n6prAC60UneLPGweCMU1/WGmN
>>"%B64%" echo fqqh9AeKifH96ZIZ2n3qGo453dz/GsGuUKPmDjdtlz8NMWaWxZ3VUr1JXn9rLtbF
>>"%B64%" echo 13XLWjUJGnP6uupzqkJimulAj0EOsouS/w9QSwMEFAAAAAgAsHlxXacHEAhmAAAA
>>"%B64%" echo agAAAB0AAABqYXJ2aXNfYXRtb3NwaGVyZS9fX2luaXRfXy5weVNSUrow5cK2Cxsu
>>"%B64%" echo NlzYdGHHxUaFCxMuNl3Yc2HfxcaLLRe2AoU3KDxqmKJwYfOFfRd2g4SB9CYg3qkA
>>"%B64%" echo 1NQI5AI1AXVsvbD3YpOekpISF1d8fFlqUXFmfl58vIKtgpKBnqGegRIXAFBLAwQU
>>"%B64%" echo AAAACACweXFdnZ7H1FwBAAD/AgAAGwAAAGphcnZpc19hdG1vc3BoZXJlL2NvbmZp
>>"%B64%" echo Zy5weYWSQUsCQRTH7/MplncqyEXDoIIOS24eEgNNPETIpmttrLux60oRguZBoU7d
>>"%B64%" echo hQ59gC001NLP8OYb9WYVEpmlgZlh/vPemx//eQCAQwx5lz/xDi5wijOcKJHQxYmQ
>>"%B64%" echo cYxzWkMVABgra6d6pXxWyBSVI2ULcIRfFNzBTxEMOwrcGl7L8mGbsZyWz5a0rE6B
>>"%B64%" echo 4AWJQonSi8d6Xhepj0yhAXW3GvhwuDpGkmM0TFIA3wlnxnui7N+tbV3fNOk6qe6v
>>"%B64%" echo qY3At6oiyXYTdWs9vuXaQVQvqe6tyb4bODXx8MXlUm0vN/BM27iPAXojK74xJKgY
>>"%B64%" echo pLQMyWhcWabTjIFKS6GErwtydsRfYAPQWb0mAxzigvcpRQqXksDlXceUc+3GcH0I
>>"%B64%" echo D/gzThU+4D382cS7M7zmQwzeK455n2YHJzinPgtloCk1KXOxZjhVM8bDg38+ts1Y
>>"%B64%" echo Rj/RSrnzStR/oiGXjcd+AVBLAwQUAAAACACweXFd8fI/E3kGAACiEQAAHAAAAGph
>>"%B64%" echo cnZpc19hdG1vc3BoZXJlL2FjdGlvbnMucHmVV1trG0cUftevGBaCpUZenD4KUhpa
>>"%B64%" echo hwbaNNTpkxFiK4/sbaRdsbtKbIzBstsmwa4NbSBQ2rShj32ILFuJbPkC+QWz/6jf
>>"%B64%" echo ObNXWbITgS3tzDnfuV/WMAz1W7ijLtS5GqkzNcDfUA2EOsLP47Abbqk+Do6F6uGh
>>"%B64%" echo q4Z8BCr875mGYRQKDc9tiVqt0Qk6nqzVhN1qu14gLMdxAyuwXccvFKKzJSuQgd2S
>>"%B64%" echo 8bNnOUtuK4IwY8666zTs5ejQdgLpBH58d48fC4Xv5hcefHt/YX5B3BbrBYGPsexJ
>>"%B64%" echo gDvLRkUU+YRP1Ws1CrfDZ9B/T8AWmFEWMOLXcNM0yhm6P/TtM1h7KsDRJT51qHrq
>>"%B64%" echo NE/4RsBHPWCofriv3qlhfF3SX0ar49v1muuQIvCuOgHSXvhUa3AK0Hdw+Em4DT7A
>>"%B64%" echo vYSEC5Z3Eut4joeLcBMhGQK/D3cfxYExjTEpjYYW82eMC9Wg2E4ilRh7WtQrDl6P
>>"%B64%" echo DoA6Al7/o0Q27eWVoNZpa4kvQDBi/nA/3CRJWsq/zA50HCUSCB/H4fNpqEvuk8hh
>>"%B64%" echo f0ONIRyfhi3i3YrxTzkBd+OgXoHdcR45CfBfyGtg60QehTvEr0YCnjoHJLnlCEER
>>"%B64%" echo yBg4Ub2FAch08f4/Lo5TiHke7r4fQYkYXa7agYZ+yR4dwA2RxhCjDsCyxYgv1DkF
>>"%B64%" echo Bd7HxYD8kslBoG0UCoV60/J9cSdouX57RXqywjKWZAO1ZTt2UKsVfdlslMTsZ+K+
>>"%B64%" echo 60T39KFj069LnAk/8FARuoLML+fv3vn+64e1hS/m78/nydnpFdFoulaQMjDhwmIK
>>"%B64%" echo WF3U4TGqefbHbrPTkh/Er0nHAeIaqYgfXLcJhLtW05eFxGar3W6u1RiDzS6L1EB2
>>"%B64%" echo Ab5TD9gNfS3QcoTt5NVJyejjSbQpRzQ4HeJk57o4Q9EcU+QGFHt1WhHrDLphGhNc
>>"%B64%" echo DZX5O7lqe9KXE3zBbpjgfFBqlitdnKG62pEZQj4yqsL22R+ULAlPav4/sZ3I8PWI
>>"%B64%" echo dcaxWnKmuvEeVdFDi9riAh5yX+hThcAVaYiWfuz4QY2Vj2K0JJuBFWXF5SjlbG/Z
>>"%B64%" echo TvGWOVcWLWu1OEc/Mtc3NVKplPA25WNJaYJxUMwQfiJuzc2VJlj3arwnIJqMsXEj
>>"%B64%" echo tuHztue2pResJRb5mFcdPy2znPbT4pvmekLKAQClARVybdjgTM2FTSLtiXC8Yxvj
>>"%B64%" echo RhVzaZwNIEwbix83MW6ZuJvoMrhBGOOIv3OgT6khcq/azXJH+ZiyZ0cOCNmibK2U
>>"%B64%" echo 0NTIq/WO52Fm12jwF/N+RW+Gm+KtwEx+4Lyoo5pG9DUvJDRFu2IdBCZQGow5c+Or
>>"%B64%" echo yo1vZkokPC+SAMdEtlwnWPEhNbMjYIyf8aDaDPdpxIQ/QVafe/hIn9B8wC2GJz/1
>>"%B64%" echo eFYOcrf61zDcQyPZzy0MdBZT0pg4pGkfYyFPeZuCDgexfAThZOzkDCHJPtN0pikV
>>"%B64%" echo nej9g/8/kfLRkrU2ZiLPsLNorI/CXS6KE4bqQ5VzmJOcQLlNptQKPqU80tNNHeYM
>>"%B64%" echo u8Dg3yK+8JfYGKTEgR58kav0anHCc0+buqsGOYUnJIEZuDBhYgocwo4jcrFOApBt
>>"%B64%" echo IPc4qIt0wD/FrLhV3dAUa9LyNkTE1yuL9dhBTB49FEvVNHueSCvABB5LnEtlSBsQ
>>"%B64%" echo wiqivemQYoRxgvXrgh8hL9zBrgiXvCXDaafWdbWtLrB10FpDnh1mK5FAz+FA5AkW
>>"%B64%" echo HNo/7jy4Nxu3hgw0S8MvjbLJbbrLux+vp9Guca6OwTuMqjKuyBXZbNcCuRpcb+Ib
>>"%B64%" echo rMK0b4V7Fe3DPufKkLqD4BoZYKWFE4ZkXo+MK4tM2+sxYTpUySM443WqS3WG/N3J
>>"%B64%" echo 2l/EIaX/Nu/pm3rHxDOeuAiehrssYMB5SZviGRVCqUyKXnDN9iksWm60OFJXYxWT
>>"%B64%" echo 7Zs8U875nTxLFUXX/VhvLlMyKuzyGsfxRq8Of9bpJPTanl0WKfUPCJ5WxZzb5aqs
>>"%B64%" echo d9CQ9CtNJXqXKQsr3fky+18+NJgbms2kFi9u386+74yPCv1aZdZXXLsui8mr0mLK
>>"%B64%" echo Ui1NQ6UavIyY7+HTeKl0p/PqZjyNl0foZebUN2Z2JYy4/Sb2G9ebuO9OlZS+niXC
>>"%B64%" echo MlIy+9RDr3NpcZrq2gR1umszb2zXSNbL8EeKBu502emr21Uezm50N+fMT6+B0+9s
>>"%B64%" echo Hwo4exVg1HMvoyXNeGri8NJ2pRqaZBoAdcPL7JkeOY1Rv/59cJiYvJqbaVNp4/dW
>>"%B64%" echo kP8PUEsDBBQAAAAIALB5cV16p7LA3wMAAC0JAAAcAAAAamFydmlzX2F0bW9zcGhl
>>"%B64%" echo cmUvaW50ZW50cy5webVV72rjRhD/rqdY9EmC1Pc9kFJo86EUrtArlHIEo1rrRI2k
>>"%B64%" echo 1a1WOLm2cLGvTY4cl1foIzg5+y4XO84r7L7RzR9Jlt1eoYUazO7szPxm5jejXd/3
>>"%B64%" echo 7Z926s7sg13Z9/beTu0N/O/trZ0LEpd27l7YOR19EGgn7Aoc7sEBTZcChAUKItDV
>>"%B64%" echo I5mHPd/3PW+oVSbiyESDNCpLWYokK5Q26yPP875ohQDMn8t873tdydCjI/F1bmRu
>>"%B64%" echo dj0BvzzK5K4ojSapTJUhSfwqHqtcij1aAPGb/R9/+Pa7r57sijgZmKdgsiNMVaSS
>>"%B64%" echo t71e7+AArH8hGP9QS2mS/NDfFYFvH6DOW6hp7sb+jvCBjhmcACHuzI3tDZ3NoNBr
>>"%B64%" echo OF0BPW7ixrjtKtwlkjRDvtxrVBzJNFV+uMMBTZJJDnZDpC7dFXnfAaVj+LO/O8eW
>>"%B64%" echo oILsG2cgq3aegX5cO07RGbM5A7y3sJ1B6CvEuOXG1OlRRtjSOQkLe4sKwmwClAOZ
>>"%B64%" echo cwRK7h2wsUQjqP8P9CckiAwzARPgXuJk4Bn7wSZT8Rotq8pk0Fd5XS+kuXBvMC0B
>>"%B64%" echo ZU/seyj1ruZ5CtxPiOVtZZFGp4KQtnGHw4bIy09Drwh0Wg/rtro0qtgCT5PDI9Ov
>>"%B64%" echo CmbhjKcByJoTD1fQoHPek6EAQ9j/pFGQegslViMuHhCg1Ug9JcVz9hZynrgLSKoJ
>>"%B64%" echo Q/1IMm6LPu7gjWRkjkDmMYVaqM9o2GjaFprIVGWdPZYOIzrhWeJZ4eFccPlki0Oq
>>"%B64%" echo RiLSUpyqqkWCwS3WAbHjr4iDcxxUAbCX8AHg7QCpX/Cs0yQuie5ZPfvEz0BlWZTH
>>"%B64%" echo ZYstTxLTds/93hRDGa/sQzsVSMsLd1G3cmyvQfsBJQKA9VnFK3YS0X/zvCdf7j/e
>>"%B64%" echo 7/+LS2CoBg1jLwH/ruGLvv1rjIsSWyHjSh+3hWiZRifrL2aBDNdsY74zrA4ltqNN
>>"%B64%" echo aVrvHMeEeYABdefMAeRAXxprsbhUyqJ1KiJtTptvao7jSON0zyPN7aZp5++HrJkZ
>>"%B64%" echo L5ZDkSudRWnyXAZGnvAlGorPPseVb1otTaVz4Qu/97NKcjLrpWokdRD2wCopcC3S
>>"%B64%" echo xARhWIPG0siB6Sd0YW8B8y1eX9QcojjSUYmX9mYyISkTzNHUNmzfSYuveTwYKi3o
>>"%B64%" echo 4tkR0JIY3pdcdHrfS4zMyiBcIwBwlJ8GIzSsM0AMkgkhBH1MNq0P/o63HEhu3pmn
>>"%B64%" echo 9eV30Lp0InbyZhaC9qqkNVxXgu9bp5AG/r9UsRkfn8rmeeyeI80QU+zttff+hr7j
>>"%B64%" echo 2yd9Hx/0PocMeAn/oVIuCBHC7ljVzzQOzSdhN4ZyY3D+h57/bbcoxl/S/ghQSwME
>>"%B64%" echo FAAAAAgAsHlxXRzC5a3cAwAAbgoAAB0AAABqYXJ2aXNfYXRtb3NwaGVyZS9fX21h
>>"%B64%" echo aW5fXy5wec1WzY7bNhC+6ykInuTCFno2oAI5JEBQoC3Q3oKAUGx6rUQmBZJK1ggC
>>"%B64%" echo 7G76iw16aHNu0VxzcYy46+xmN0CegHqFPklnSMqWdp00RXOoDrZmNP/zzZCUUvvM
>>"%B64%" echo XtQ/2FO7IHZZf2cv7Eu7GJJybqZSkMGM3M3U/VyzzMykLqdccXJrMDB839ymlEbR
>>"%B64%" echo RMkZYWxSmUpxxkg+K6UyJBNCmszkUugoanhqr8yU5g2t5zroJxu1kVPpE11yPpqy
>>"%B64%" echo XJSV2VCyMkAGlVwYLoxuNMfc8JFhnhtF0ZhPyDQT44KzcqoyzWP/NyTaqD7ZpjNs
>>"%B64%" echo nCbXNrweGXxGTFUW/JaTviNlcXsYEXi8A5J2HQbjPS8yaaRyTb6QgnvNjnbj86ZX
>>"%B64%" echo p5W4J+QDQb0Fxcti3pLi+3xUGR579Xb0jTxUX3i1fnCSiGzGSZoSyvdzQ0NJVCUY
>>"%B64%" echo No8VUpZxpTm7L/MRFAFTdGmDto+31fF0R41i77pUOcYPMFrZ0/qwPgIELetj+4rU
>>"%B64%" echo B8D6067t64S8fW5/hw+vAWs/1U/enpG/Dp6S+tC+sWv4vbCnBBCI3xf23L7so/wF
>>"%B64%" echo mHoBvFdBGq16fCahSg+mecHJN6pqFdio+ZZw8bnGQAYOShDoL/XxkAQL+PD9ES8N
>>"%B64%" echo ia9/eeO6UhK6/Tmf35GZGmNvlKpK07tk0qXc6/BCBz6NtgzXCz2VVTFm2AKIYRcg
>>"%B64%" echo r3YTnw7iE6Cye3EwuWlaunnb6gH2Wi6Hu2PcQsFpf3Qs/ApdOoMGYmeX2MIOFuwf
>>"%B64%" echo uG2Qgg6vsNVPgViAyBLRAO226w4c6scOQL99ZEC0V0xS5BqGJr4Ci47Q1464ie8O
>>"%B64%" echo KiTTKLcLHRMK8f4ICb/AZIfkIcg9on0ygQhTWHyJNmMAV2+HKoVRWbmCndqz+mdY
>>"%B64%" echo zgv4PayfQMYES/buOaM7QfmOme+ABrZ1qEw3m5EUJhcVj7oxTsIcPfQ6j1qO///A
>>"%B64%" echo n2U5dLqDb3cuKcR2OKOSa2qvmsEa/cp9iUsl91J65SwMeXv1JBuPWRb04k0E1B+X
>>"%B64%" echo tL/h+AFKqTYSzkwDeG19nPKiTOl7+0xigNXKnhCYkDVIHcCsfQty53bRC5Y+LC4h
>>"%B64%" echo B66M/y428LMi4O4EAnsM8FzD4C7qIwQoLu0loPeoPv7HQKiHAQyFAJ5O6SfwGjzg
>>"%B64%" echo LeQcryStNYBkSPsEOG/A96G7t9TfYxVg4yxCO9Ac9DI4dX/oVsN4Nwc0ksllwH/Y
>>"%B64%" echo lmuBnF2BNiU0uSsBXy0Hvf+A9BtZoXnbb4NkpDZiEAYOsPMppOd1MkUADi9bee9e
>>"%B64%" echo aMnsOiSgkhEYZwxvGXDtw3sGYzhZjFHvCbcczmLs560X/Q1QSwMEFAAAAAgAsHlx
>>"%B64%" echo Xdl/jK9pAgAAVQUAACEAAABqYXJ2aXNfYXRtb3NwaGVyZS9zcGVlY2hfaW5wdXQu
>>"%B64%" echo cHmdlM1u00AQx+9+ipFPtpRaXHqJFCQOPfSAhILK1VqcTbJg75r9UFsQEk0RvVRC
>>"%B64%" echo 4swF8QKlapSItskrrN+I2bWbxCQIwR68H56dnf3NfzYMQ/vFXtuFvYHqg51WF3YO
>>"%B64%" echo +Jm6iZ2BvbNz+xMni+ojGt1DhN9l9QlXcWav7G11if2iA9XEb/lRnePmCTwvKc3G
>>"%B64%" echo fZqJEWeaCR4nYRgGwVCKAtJ0aLSRNE2BFaWQGgjnQhNnp4IgyHKiVOPikJdGH0gp
>>"%B64%" echo ZNQ3XLOC+kncDQBbiYa4YUCHkDOlKY+chTC6C4xr6MF+B8qxJIqmOSvYejmGvceg
>>"%B64%" echo tKzdaHlaD1xrQlL++FSur+At6ElGSw2H3siHAkS51bUDSZii2+Gv/rsW2q8OOtJC
>>"%B64%" echo gjvOAqQ6heq8OqsmiBkRY5ZuEfB9AuFvnr63jOY4noKd4YKbnGGq7jB9zmTehZKV
>>"%B64%" echo iEBpkuewJ0HSN4ZJWlCuVaJP9Np1DD5VeLHArzWxvaUS8W3Hm/RX/6N4m+kx0+Nd
>>"%B64%" echo u56yTIpyLDiNYsdRCSMz2m1dcH1yQgavjNLpUMiUFC8ZRp1ygbCjel8HBkZ6FfUe
>>"%B64%" echo JftxywsxAyYw9A1vjWJaZq49OGuk1Gv6lZLcvJZTb1NbLT/xplgOfOey+j9SGTqt
>>"%B64%" echo tKvQicPe1FlFCS2dLrA0l84Es47VW106GWBZXmC/2CkkeHb6xEGJu/AOg3r/59y3
>>"%B64%" echo Uikpli7f5LgapiMhRjmNPOsO5ISPDBnRXijNXv8obDHZIYYj/pqLY/6C5KYu8q1D
>>"%B64%" echo w/AvLvqoZ6r+rS6R7zf/4Plycc/gFVbNEkHN/BN37bHNq887sT/A22D2C1BLAwQU
>>"%B64%" echo AAAACACweXFdogOlVFYBAAA8AgAAIgAAAGphcnZpc19hdG1vc3BoZXJlL3NwZWVj
>>"%B64%" echo aF9vdXRwdXQucHllUbFOwzAQ3fMVJ0+JVLKwRSoSQwcWJiQGhKLQXpAFtSPbQY1Q
>>"%B64%" echo pbYMDGyID0GlQAVt+QX7j7iY0KDi5ex37+6e3zHG7KN7sHO7sQtwE/vq7u0SwqIy
>>"%B64%" echo Ro/2I3BTj9p3ykyItibyCtyMoA83pbix8x+oZr3ZpV0RtIoZY0GQKzmENM1LUypM
>>"%B64%" echo U+DDQioDmRDSZIZLoYOgwXRF92CAOegCs6vQ4MgkoI3qQKkxvZG8jwlcSHkNXThR
>>"%B64%" echo JUawdwDHUmASAJ1CcWHCnNknEvHspS7dNIHbutGYRZ7E8z/NPFKfVGeVnxc1CraA
>>"%B64%" echo F7AzyKiqLW3EN255GEd9LAwc+UxPKalaukIyQvxvg+KSC6SPNY1iLrgJo5183Orc
>>"%B64%" echo SahSHIrBabYtakT0fCCfIdM11k78tevMvtC6Pu2G9mzXtMFFfXUzd2e/6LUmA6lu
>>"%B64%" echo fM46kPNr7NKaYm0GqFQUfANQSwMEFAAAAAgAsHlxXeAlsEdhAAAAdAAAACIAAABq
>>"%B64%" echo YXJ2aXNfYXRtb3NwaGVyZS9qb2JzL19faW5pdF9fLnB5HYq7DYAwEEN7pjhdjRiA
>>"%B64%" echo 6SAUFNDTsAEN4iNCAimYwLcRhsKS/Z5VFSMSNmsQrZdnwoAZgTmse2IpuKhveHNI
>>"%B64%" echo VsGzr7lYi53rplvIArxQO5b4T+JcqGerzfGYcH6nQlWzF1BLAwQUAAAACACweXFd
>>"%B64%" echo qYuYWiIDAABiBwAAIgAAAGphcnZpc19hdG1vc3BoZXJlL2pvYnMva2V5c3RvcmUu
>>"%B64%" echo cHmlVd1KG0EUvt+nOOxVAjG9X2ihSC6ktAWF9kIkjJtJXLvZWWYmWrGCxgotisX7
>>"%B64%" echo UvENgm3sGo2+wswb9czsTjZGi4ILyc6cOb/fOfOt7/vqRA3VX3WjbtVA76kxroag
>>"%B64%" echo D/SuGuBmiL8MBfZ0F8+uUHQJ6hxQN9N7uo/7a2t1XVplqJbp72hX+US3eJR0qnXP
>>"%B64%" echo U6cTHxlYrRFufqs/amC2Nkimv+l93UfHP2yQr+jvUl3pQzy0tkM1wphokE1sbOrG
>>"%B64%" echo iz7WfWOFBwOTmjW4xChZ4AkqJeYh6uuCJSb5G7QYosYFxuwD+sS89JFJCTBBk1em
>>"%B64%" echo xvqwDuoMvV+beLfT+RsgLlDQfxgM7wEw1C91BpWPUdJimwLmOW3RREYkhrckIR3K
>>"%B64%" echo 4QV0Sfh+Cd7QrXCNRAkKlmjIqcQX34hCWvXyPDB5faDOTXh9aN/HDjQDE+qMMPYF
>>"%B64%" echo lmj6gu0doHwfsxypYd3zfd/z2px1odls92SP02YTom7KuASSJEwSGbFEFDp1B51T
>>"%B64%" echo eR2GrJdIz1tqLH5YmG/AS/DXCeYn5ojsMpGuUU4xghfGRAhTjJCM0wbnjFcW0TLq
>>"%B64%" echo 5ptq4AE+KWqhdou2oYnjUkljItuMdwMQktcgZp0osesqzL0y79wMYenxBNr+tjPY
>>"%B64%" echo Cbat8o5fuBNkgzaN+03GW//3WwOnU4Z5xxKax5F8K1+Yp4CgmGorpp9DmkpYsCe2
>>"%B64%" echo LiDCSEsrTiJBZ4CYHJrHVz9tT/fNDDrv+YCbtpmJt2N1bsduHEAapRAlQpI4dur+
>>"%B64%" echo xGMVbOMwBSsqzk0fSzCK3tXuQl6gUi0RqRZQxoy0ngClaxF8eRaCU9DlXTbOprvu
>>"%B64%" echo auo8vSZXSYvGVD5lLJ49B7NV3HfjypjN6bFKpuI17Avva+l16kKtItk0SX5hRcUt
>>"%B64%" echo AogjIZeLi7xiC21FoVyWvTSmyxYH/FupwSpj8UruGVlDnebkcodPgpxsRvl3wixw
>>"%B64%" echo i5M8NtyEPI2MOLTMbEjXsaI+wXlGejXfkgmt4ugbLr1HnHVDWFPN355U6iqqlxA5
>>"%B64%" echo SQ5VMDO4d27dI8blfSrbLgDpsZxG87TNhc/t8Eq6pbDnO94/UEsDBBQAAAAIALB5
>>"%B64%" echo cV1LNcT1zwMAAO4HAAAiAAAAamFydmlzX2F0bW9zcGhlcmUvam9icy9zZXR0aW5n
>>"%B64%" echo cy5weZVVzW7bRhC+8ykGPJEGQxXtpRCgIkaToAWKNoidk2EQa3Jp0Vpyhd2l5SBN
>>"%B64%" echo YactUqBFfOmth176AIprt04MJ6+wfIU+SWeWIiXVSYPoIGpnvm/mm5+lfN+3v9nX
>>"%B64%" echo 9pWd26vmF3vd/GwvwF7beXPSPG2O0fUSnZdg39Ch+cFeIu409jz7B1Je2itofkTP
>>"%B64%" echo HCmXSDhpTsGe4eEC0Hph32CAv8mD3GN8ng7hu0F8wNRhoRNmSqmnY674QHNjimpf
>>"%B64%" echo xwdaVrFnf0cBlPyKUrtoJxhhkak5bZ53uTAt6ntt/7Tndg7/HP8KlMvVgmaS/b19
>>"%B64%" echo QWGaZ11x506tOwwBf5+T0uYEiND8hKJb8jzykEeRLwlMyFdkxoDXLsdZRJQr1PIM
>>"%B64%" echo SWcuOMokzhmywb5onmOyvzD4U2jrmDsY9jP2fN/3vFzJEpIkr02teJJAUU6lMsCq
>>"%B64%" echo ShpmCllpz1vYqDEtPmOGpYJpzXVP0FmRmmjpiiAvuMhawpSZsSj2OvB9PHrenbv3
>>"%B64%" echo Nh9+tZ1sffPwwed3t4ZAEXa0URHg1y6M4LEH+PFzEavaH4I/Nmaqh4PBbDaLnXGg
>>"%B64%" echo tB4wIeKjUvhRix6zPbUKzhXnglUpj8kTp7J0rKmSBzw1GmlPllrufPkA85K+eCxL
>>"%B64%" echo HoQwAP/mtvg94f7m9hfIWOUjY22ZsMve7b4vnvuGzTSVdWWGTvNUMJNLVQ6pcGcR
>>"%B64%" echo cr+o2uNbyFuL8C17hg3gJmFZprjWjoSKcLjkZG0eNItCm51FWmquG0+Q8ZzVwiQ5
>>"%B64%" echo S41Uj0aECh1zwh/NpMo65mIk72PpSSHEB3L26mwfCyip4lxIZuBb+FpWHKn0WMOw
>>"%B64%" echo o3djtKxVyvVbFukdCli5l7EWHvxnG8NW2lQKkRSV4eqQCVJYG0qAFoz6yUdti2sj
>>"%B64%" echo E22YMokpSr4yAOe+7WZWcjOWmTOgDJwvy4JU4C2hqzF0G7deUQi3PgO/m7TfjtpJ
>>"%B64%" echo IuiofUgFq4vYY4oc8P46TMyPsNE6CJcR6KM4XvgKUEIQ9g7aMwzt3oCkUAcuguIs
>>"%B64%" echo Sww/MgGvUpmhnpFfm/zWp364zt3xu3XzqevdtgUbGywEXHBg2DmHjHGYwRIdwc5u
>>"%B64%" echo uNvHmlRyVmEAvEbUpDhJ+huQuFHqJFlmXillY+PxZAiHLtckwh9dusLwEiulxkzI
>>"%B64%" echo 6DI8Cb1+IJod8kBzkb9nImT+sFm4Fk6Z4pWJy0lWqKA96NG2qnkEbj6JnLjjjVm0
>>"%B64%" echo 71Wn7P97vQCuNppIcYfaXRc0U9iSdqhre+Fmn9XlVAeUBeVVmv4ZmE6LYnSPCY2S
>>"%B64%" echo iyrDAkYfh+Re34g+2I35UFrvX1BLAwQUAAAACACweXFdVvbK5psMAACbMAAAHQAA
>>"%B64%" echo AGphcnZpc19hdG1vc3BoZXJlL2pvYnMvZ3VpLnB57VrLbuPWGd77KQiuyKnC2o7r
>>"%B64%" echo DgyoQApMFk2bLmJ04xgCLR3JrClSIClfYBiYK5JggvG0GCBAm0wRdJGtPbUnnhnb
>>"%B64%" echo 8wrUK/RJ+v3nQvLwIskeoN1UC5uizv+f/347xzTN9GX6Nr1Krw38OZk8mDyc3E+v
>>"%B64%" echo 0/P0rZFeGOklnq/Si8nD9BrvT4z05/QE60/w/zp9ZVjrO16QsKhlcLjz9HTyKD3H
>>"%B64%" echo 84PJsUEA6SkAv0ov0jcG4QbQO9sxTXNhoR+FQ6PT6Y+TccQ6HcMbjsIoMdwgCBM3
>>"%B64%" echo 8cIgXliQ75LtiLk9LxhkL7why54FBYYb41FgVa/kiiGLY3fAtsL9lhF3o9D3WS9h
>>"%B64%" echo +0nLSAAhQJxe5PaTWIEMWMAiN2Ed/hpg7q58lst32EGchBFTAJ/J7/eiKIQ0tryg
>>"%B64%" echo 13G73XAcJLEEH7lxvBdGPYlhGAYeIBSCP4iv8se4u816Yz9D78WdXdf3eh3iHPhY
>>"%B64%" echo Nwx6cQfYPV+BsCSBiDIWPhG7t4wv5A8LCwtdHzQYvwu34k9Go7UFA58e60MLHjbv
>>"%B64%" echo dKyY+X3b+Og3xudhwMTv9KHXOf52htHxQ7dn2fo6xVdbsWRp4KXVURgmWJrsOOs7
>>"%B64%" echo ZUz0m5N4ic8sM32RvoZ53k9fwRgfGOlz2BJsEzb1GPZGlvnv+y+M9DtlnZOnZh22
>>"%B64%" echo AQuHLIkOLPPu6uL+6spieZU7TsJONA4C0Aq6PnX9mOkrOltjzyeuc/GJNw3CgznD
>>"%B64%" echo 9MId4hJsfi6/WhlRdmWpM3K7O1bf8/22uRUm22bLYPsjN+i116Mx1D9ye/vtu/z/
>>"%B64%" echo QfuupEQQKITc6UfukMkdP6VnS+Gu2c3tEfFFSHgG/KNtpj8UQsIbSPaiLC/Be0eB
>>"%B64%" echo l/AUSJNmcXPKNMCMsO+LcakUlRpolIh0hBU1Flnx+y2Dr1rLya3RMNQAhg5NUou5
>>"%B64%" echo ZkAx9HiAx5WjbBEh+L27xXxLZ+R5ekaBk2z6LXj5GjH03eRbYsaw0jM8Hxvpewqb
>>"%B64%" echo k0eIo+ecaby6xst3UM7DyVN7zbSdQeT1rGwz+kThXnuxZXRDfzwM6ClOvO7OQdvc
>>"%B64%" echo gznduQMKs+Ulee25iJBJhwVwFKmpe/SsKN/zesl2e3VxCpjjBTGLEou2LXq/WgTF
>>"%B64%" echo RojK0zBwjnQmlgpMMMVFwcaaZPw3SO8Zl96rydP0HJkIsoOhkIzpNc9cPwsrej85
>>"%B64%" echo hlAfTZ5NEevSrcSKlEHhP76xYHXAgmixo+n8OfQCPcRmAPZ0RJmElz5YwogTXLaI
>>"%B64%" echo ELcT6fKtRBrvIEbeXKBFsDnEKZaXhakhyUS5/MGi/MvkGfz+NVVRcHP8+aWB79cQ
>>"%B64%" echo 633UVqfOFCF+fFMhbo17AzhcNSbL2Fi3Luf141pec1Y1cUkUQy+oUVcRv9La0vIM
>>"%B64%" echo DEpzmhhIjabh9UthJ4dFKcXDt8GQ2UF1qTwprLSbrE4tcfc/lBWF4TasuPvzsuLu
>>"%B64%" echo z2QlkymvPGKvx9qmz/qJKYsNco/VsgdUuCgDz2HtzxE2qCsQceIRIvNbnu8MvKcQ
>>"%B64%" echo cilSHnLhT+lPa0j730+x/5XbBRFZa88KIxUt6oCNKY+XlHHiRgmv3qcjyZxrZYZz
>>"%B64%" echo 1UhWk4cgXXvFRa6vog8p4S0VHAgvV1RQQNjvea2NqgOinzzhjdwVj+LU16Hvg54u
>>"%B64%" echo eD9HGkLzmF5my9DrAWryDfIsWssfYcQ1OwLDYyx+w2uYJ9C4ajqBEk3mBb27ohAI
>>"%B64%" echo bWvgds6SnQvrV0XFi6cY9TJF42miUw3a7ACor8w3Xp1jY9YQETOcScTU5ut43PXY
>>"%B64%" echo nq4lfXddqXLTtmWOfDfph9GQ0pgfDryAHmB3yTg2bR0o3gbt5rZoqmNT/3GbeYPt
>>"%B64%" echo BAbY5DAa4Y7Eou0vnfsfskR9zIcHl+lJpduqx6Sol2j+DtP4F8zqak5wyXOBDGnM
>>"%B64%" echo k2+nY6gGP9GD7esNWCEvAphqf63dL0Vh9TqHgpCUSg0kpPrla7rCOEvYqc59yXku
>>"%B64%" echo EC+PeRS9qvobcginFO1vYllyB0fpq6WIcbjcC1FefXh+MckhRUF3Vt1GB6qRbV2G
>>"%B64%" echo 4+STlbKgh3+7rj9msOQZBLakNOwGArbGSRIGsebOugdV1jalvVVbC7O/5astCZTZ
>>"%B64%" echo 1wvY1ikVwNSPwsYoEgyHZC2i/USzo4zDLrb2++Zc6P/J5f2uAXnEhuEuK+HXM0Fm
>>"%B64%" echo w3xesFxw67rt9fz8I1w3C+xEgD4mFDOBMk007mrK0b+uy2tsSo4WEVfAdMOg7w3G
>>"%B64%" echo EbMAvCfi1FK1hR8WBk9zdfBbbjS1/HUjXW+lEUyDmbhRHoK4tF7xvkiIERn0PH2D
>>"%B64%" echo VgnCrAhwFPq+XVNO6f5FdYUwFkm83FiTeZGK71SRhSwrlXki6q+PeLH1GmHkskJM
>>"%B64%" echo Eg4GqE9ou8aMkJMyhytxELgyqC6OY50v5Jd1fFFmKJPR8kpWhS2VuzlgutHAbLVo
>>"%B64%" echo MAXfbBrg9TxXEEv5ORz5bBe1Vs30TqzLBpY/kMLREr8x+Gwqq69KTi9KNwHbnDiz
>>"%B64%" echo mrcy1RHClayt5LhV8KypatVmQqAfLzYBNYxgmnZs5CbL3xoXS/NwwQP+jVgoQDQM
>>"%B64%" echo OGbTrzlQRTVZMYE6uaYSPq+phFuGSJ552cvHdnWl7PJcypVHCblkmgTTkrXeHbMJ
>>"%B64%" echo umF2Ud46N3O4DY/D0dCq8ZaiGYGwskWhALEdtKreyNLzN9cbADT9Na5WLNAOJW4I
>>"%B64%" echo RluL6icIk5woVF/0nW+k002f/LDIIcl5QT8snz5QxSJiKe+QxBj63MgmstJrJ4/4
>>"%B64%" echo Cdo7Zf2OWa2sIpaMo6C+1JtecIErxXmVCQii+pIjLx5EWXmBJQsr9UuV0BJlM0tO
>>"%B64%" echo tt9lo9KxGB3R4X09ZSW577lRwIv5iuhpzgEs9rwVZ02BWeFbFpR2jeM7PYYdwwOr
>>"%B64%" echo vlrSo8MfPytkT+kk9oyBGTOL+Ugv55pSEnUQXsKGWfugc45XrEtHqJa9NktKPaxN
>>"%B64%" echo mEXYinR0KRN3E/00ZNbRYGm6T/m9Otav9en6+TUQbGj07yhALoGdjP3yYFvsMfI9
>>"%B64%" echo qL9l2uQsO5U9Nxt2F4Pdyt6xtnecd27aHLhm53jKzoSq7zHUrAEvd0Q8B2o9B1lm
>>"%B64%" echo PqgzW/Wju1KLn4O4+2UQNbArDlN0Q4ncPQigRmNOxOA9XUbc0bjcLLshPKk8iGxp
>>"%B64%" echo LPb90E0sbMCFQxvx9pLMKseF153sDLxdPymrNSSBMoeFI/Jorx2gW8UlFc49UPMn
>>"%B64%" echo ihQ8aFmmWliuv5sGfKC3iL8JSHphxc7kuX0WpNqIHBumCF3m5sbipoxapfdLm7om
>>"%B64%" echo yLKwompLGSmlaIkAIKNAefWMaEMm1d1G3xWxoJR6iyafxxZKQk3xpJK5RA9SCUc5
>>"%B64%" echo Zplpco3p8KW8wrhOa4Yo1QyvHcSc8VT/mqbRRno6eSp6uK9oMc/wl61sYj05FncR
>>"%B64%" echo eLEn63dRIKgRtjNtdlIqCUZusp15QBaiSIK3vXcxX4XTrzn8p2I3HwdAFJOna18G
>>"%B64%" echo h0TikZbFYKCy+aa8uEY5uyl3UIpVmVpkaQIxfmGYXwZlj6O1MWNiYXE/6pf/txZV
>>"%B64%" echo Z0B/zexBtdnFYw51ZWWamUy1jJtpPWB7HaRIFiEcc5Kz9CxROFyI+pSSA5Db59B1
>>"%B64%" echo sqQ7W+MASYEv0VFIaRESsW0dArIXGNzLydeoKk+5bGRXRZfHqJHCqzXjUCI7MrWA
>>"%B64%" echo T/E9JzAL+dO3yxp0fvyAx7PJE/73GA0bP3/Qb7qJ4whHM7uMb2HrgvuaAQLdG4O0
>>"%B64%" echo 9UtlQlilwyK74vfZxTO1nn8pH81iZR82h8iUx6xDDiCT/trgyJAHyPxMsfibnO+a
>>"%B64%" echo C1Up9c0NiSYOx1GXHW0qtHzMcXQoMBxVrtwIYEOtHkd+8xoYPM3FrviEDKqGoqsh
>>"%B64%" echo pTCFavJ0dVRavMNVV/9Ou+Klr5IjLTF2tG40RZvquv+PSY3qoIFd83BR18RLroMT
>>"%B64%" echo ZTlz6KJyml6q3aYEp8aTakqH+Pae1wJiTv6MRHg4daejoiTJAZu2rpZjGS0FHo2M
>>"%B64%" echo rm8oMa/xG2KUucXFshOsOuN3n6qtet8sUUqJoMNv0KK6pAZjnLD4iO4C8ylGQ+2S
>>"%B64%" echo XdJ11vmTBVYRGtQZCHHvh+EIAcxFjxuIkzSHC0S7TJmtnOXm8+lwz/USnukKN2bL
>>"%B64%" echo J3RNB/RcOjDkDmWvyA0G6JNRmRNK266OMWQqmhGD1Kdm9MPFCAqc2GdsZC0V7FZq
>>"%B64%" echo A5yge6PTjzlUZht3jNXFDMceanQ2i7raydGNawf6yIh1j//zwqBx+tNcAmQmzJM/
>>"%B64%" echo gI9qRmi1xG2gS9rYrChyZj2T09NU0yhUM+qa6YzNWduovXT74zr+75hf5pVAlbsj
>>"%B64%" echo aCgV8fxu9dD1Au63hTaeb2IsLiwsSCydwdizdCxykbyVTiOGMfWR/wFQSwMEFAAA
>>"%B64%" echo AAgAsHlxXSgPbCCgAwAAWwoAACEAAABqYXJ2aXNfYXRtb3NwaGVyZS9qb2JzL21v
>>"%B64%" echo bml0b3IucHmNVs1u3DYQvuspiD1JzVaoLz0ssr4ELZBD2kNyMxYCLc3agrnigqTq
>>"%B64%" echo GI4B2wjiS4DkUQwDQd2kdV5BeqMO/yRqtSqqg7Qkv5n55oczO5vNms/NQ3vbPDV/
>>"%B64%" echo N/f4fWzvmi/tTfO1eWz+Irj51PyDmwhor0nzZ3OPJ/f4fWoeFgTf39trPLohiLkx
>>"%B64%" echo qDuNRxACcJO073H1rf3Y3iLwvv2AuE/pbDaLorXgG5Jl61rVArKMlJstF4rQquKK
>>"%B64%" echo qpJXMorcnio3YPE5Zwxyc5rS49wLvaCM0WMGc/JSgdC/nP5U8lrkID3wd1GAmJPX
>>"%B64%" echo ZvcXITgu1qDy00xI6UVAqbI66WReu3UURTmjUpJXvCoVF4uI4FPAGr0ocSfLYrOj
>>"%B64%" echo HwlsPQ9WVsOi09WfGesgFp0PR0dSISt8reaElVIdGdKrFVn2VEPdUGVlgbrRihZd
>>"%B64%" echo kXfkN14BwvXHIhPy46FZLgYUe1+XHckhwNHztkHsyo+sLztKpFwHvyXBxFpmwCRo
>>"%B64%" echo gTiJuhhuMbOx1mmoqnqLkQi8d6HQFla9DxWcZ1yfI4EAjByOVh0IdJo9wFEMjtdc
>>"%B64%" echo EFslc1ILRspqGBpfQmmpYCPjpLeuHyUuhhv6sZRMJPoQxqh87iwlAxF4m8NWhUVJ
>>"%B64%" echo qNS7Y83Wl5Rut1AVMToTIyxJRricV0i+hsGB9tRQ0z66sI0kMWfmKDVvTF0QEJfr
>>"%B64%" echo kcykRf0MZFNaFPFQ/5i8KRsU2lAdOGnxyX6zfQX4oFh0BxaA/aUKcHMXxL70vB1z
>>"%B64%" echo aa33C9spTC0ec85646f0Qiqan+kbMbu0rqhSMbgiblWAzEW51U3qapYyfo657/l4
>>"%B64%" echo 57ryOoOLcxTcCSvC9HWh1UV85nXoTHTmdTLPxsXqte0Jl4vErxRvX0jHsj6uixNQ
>>"%B64%" echo +poO20Qg+UbUMO2HVZBtkFJ412lVDC08n5Tba3REd780ffvfVg8n5f6H1dD/rmpE
>>"%B64%" echo XWW0Vnyq6fMqw6IL+7rvZJrhagA0FbkzAjxwXzs3odCTzkzCBZaBmoJJBrANVa8Z
>>"%B64%" echo p6pTvjTDNTWoyVGB6kH8QRmiMWDxwXwnmLp3Zx6kM1krkAn5gfz8U6cj5zWSXJJ+
>>"%B64%" echo 5/y0ZGCCOkzB+Kr6TmpmRDLd04JxMO7JJh273cHVlE9BWENjFdrWBqSkJ6Ctubmy
>>"%B64%" echo ty15hbHDDy3aWDxbkoNdIn1SR+VshQ6XYeIn7vhg26Q29tnBiRuZngfiBDLdlmM/
>>"%B64%" echo QP1fJ1enpg78VLeW3D243BkQe+bKVfQvUEsDBBQAAAAIALB5cV3kekQq3AMAAPkH
>>"%B64%" echo AAAgAAAAamFydmlzX2F0bW9zcGhlcmUvam9icy9kcmFmdHMucHmNVV9r3EYQf79P
>>"%B64%" echo sd2+SOROMRRKOWpDIRT60pYkbz5HyKfVeWNJe6xWtsv1ILZLEpLSpLSQUPoS+tgX
>>"%B64%" echo x71Lr3f2FfIJVt+oM7uSTr4rtMZI2vm385vfzBylVL/Ul8WZXuo/9FRf62nxSF8U
>>"%B64%" echo j/WseEGKJ+Z4DcpLPdNzfBO9BOu5XlQCj1LaakVSJMT3o1zlkvk+4clQSEWCNBUq
>>"%B64%" echo UFykWatVyiSz1sNAHcR8vzL9Go5lHC9jSvF0kFW6e+W5Uotc9lmt/UqGTLZad+5+
>>"%B64%" echo 9vn9e/6dL+6SbRPNOxAJc1xym1DvYSCPeOYHKhHZ8IBJRlEcyiBSGaTfCllE/H7M
>>"%B64%" echo gtRR7ER1SaakSzo7+O62CPyhGAJL5mX5viPpp7sPdvZu7dA2oQQeqHaNoWRQgxSl
>>"%B64%" echo 3kPBbTwvG8ZcOa5bXRX0+yJPlR8J6QjMv2thtEmFvVujrvIg35IvRcpsOuBIyiCE
>>"%B64%" echo p7WXV8oya4V/wzhQYJ1A8qXSq0ReLI6ZdFxPskQcsSyPIn7iUE/mdEPWFwl166A8
>>"%B64%" echo WsUN0nB1gFwMnpKk6oZVOo0SVenEYsDTZu0QZlmpAUuZDBTzDVf/u1YlZ1zFDHCX
>>"%B64%" echo zNrEjNAiUWLI++v6kGV9yYfYtC5gsUGMeXbI4zgDeyTdklvX3epcLMyajLA4Y4TC
>>"%B64%" echo fC3NnF0SHDH9J3y+NcN2VnxP4HihJ3B4UpxTc1kaJCb1jU5ZwTbpUf2zfgeOj3BG
>>"%B64%" echo i1OiX8ItV3DXafGdnWYbbz8PBww7OKL6x+IHuOwdqM+IGWnI5FnxAiIszBKY6VmX
>>"%B64%" echo jGw5rF93MIa0i3P91oPOBpBNZYmQNil0asLhvld6YjBfQlJn8DzXf8F7+kEv7aW0
>>"%B64%" echo afibWTQTSGIBiQGqp3pa18YkNiXvfx8ZSsbvF96a+y9gNCewufTfgOkaEC1uVBZA
>>"%B64%" echo Gcp3ux9tbe2N19xHFs1Y/wrOMwLXYcbPYc1hNSyZ6z76p5pVtIeNafkEoIbk4rxt
>>"%B64%" echo v5cYhuD/BMsOugUesPKnUI8JQLtCLmwEPfU2avOGgB3UBHmzpdBX7V46wkYZW8tq
>>"%B64%" echo vWTB0b8PTL3b2iTkkvWVkN90zbIslwv0B77MGKHYzlFtC+rVNzTfaufetPOSQ/h2
>>"%B64%" echo hoFksIu278uctQk74ZnyxaE52gHMgoj5dlM0d+vug96x19nDMfPh0VwoDT8e/qeP
>>"%B64%" echo eYKhu9v5eKu7Z3zxd+cGjtvIfSOTsT8q44+9JCynR4QIvtnVH1YTYrtxg6/XptmX
>>"%B64%" echo QCiSNa8Hqrykl+o3YPEc+mCuL2ptLuONUJ1OB0UjZG9cqdwajHcsOSxI1DqYJ1Q6
>>"%B64%" echo 7YsQNsQ2zVXU+YTe+GFCl9Y/UEsDBBQAAAAIALB5cV1rxgtkMwQAAJAJAAAhAAAA
>>"%B64%" echo amFydmlzX2F0bW9zcGhlcmUvam9icy9zb3VyY2VzLnB5lVbdjuM0FL7PUxhfxWwb
>>"%B64%" echo phdIq0phGaAagdAMajvctFWUTU5bizQJtsPO0qnUXYS4gHfgFXaRVgysdp4hfQWe
>>"%B64%" echo hGM7aZN2VoheNPbxd358fk0pLX/f/VS+Lt+Wd7tfyne7X8s3ZDgadXH7YveyvNfE
>>"%B64%" echo 8q78u7wj5Z/lK1y8wu99+QfRlLvdz2S3NaTXiN0SV/OUb3e/IfCeSBUn/CnzKKWO
>>"%B64%" echo MxfZigTBvFCFgCAgfJVnQpEwTTMVKp6l0nEqmoB6dbNKPFACwBsksIJUjXFNQkkG
>>"%B64%" echo YyswDlUYJaGUIGuJe5JFFCJBIzwQIhM15Hr49UDvWwgB3xcgVY0Z2m1HH2c5pI7z
>>"%B64%" echo 2fUXF4NxMBwQH030omyV8wRch+BPUHcaT6bxVE6Ls7PwbPah+6Q/8TqzafyIPWFT
>>"%B64%" echo qfe7rfb17T8v393utlOP0Y6W8+XF5dVw8Pn5aOAwx7keDYbB+cXgcoxa6Feh+IHL
>>"%B64%" echo c7XKZL4EAR+deT3iPspEDIKsspSrTDB0rmMuTEZZISIwV3OHRar4ym5Y3xiZa6c4
>>"%B64%" echo zqd7D7l4/x8h9ceiAFbJuNKyLV4acX2MozB7ozbg8YGiuEoaAHTVYRODjATPdWgP
>>"%B64%" echo xKdFvADVJ/MkCxW5JZdZCnhR/UHLYpijkUJCYHGughtlmBnpftJishauQhUtkX8f
>>"%B64%" echo Gk9CKKKlYWQGwucEM8wiLZOJF2Aaplav2YfPUIwBeQuRFbnbY5gReRJG4FIbUwwX
>>"%B64%" echo pQ0qOSZ0NMGjVq8Sz0/UmQu4qMtC4CaCXJFvw6SwcXrYPuuXIMmiMHFVuDg4BL+W
>>"%B64%" echo pYLjoSdknnDl0g0a02OTbm/WcqzAqGNVBXvPdpphNlITLtXEpMGskp6hA32sOU/X
>>"%B64%" echo C8J4utgLYYfUkP0mL3JMZuZwjpUHtn4JT404jysQLjtcmO9vWCE9vAwjH2ARIHRF
>>"%B64%" echo D0j9izJM7rSAPXHOIYlRf8wjNbG3UsaE9eaAQTOiJU9ibUSlpS3WSplUhhisMUML
>>"%B64%" echo qrd4ZbytCbz2RO6yvQhTDQi1YjydwNTQbKLscQlPvzuCadIRqkpcKxQ16o2G/Ycn
>>"%B64%" echo GmV3pKNxcqSqLuwjhkXBY8q0bq23jZZemGNXjN2WNSbybZL+2Qzz7adzclyr9+vF
>>"%B64%" echo KcR4wTf/p4fYdnxt4elJ48p+Y30KtP3GbzWfOV0bhRuybvBuKGuzH9zImrVovVTV
>>"%B64%" echo 3hywsZjaq1tkq+w6RLfqrMCK5Kkutd7H76nEakb59XjS8jpkCaFW5q/ptQTRPV9g
>>"%B64%" echo ZtM+OcySzQM96RlXy3q4uaKedpUhfvVletgKkDnOZ2hnXt0AzDS0AGyFYewyL4Yo
>>"%B64%" echo i7EhFmrefYy5Zoav9GnVKWmr/bn1NO6QsVVa7a5GdnhpExDbaI4hl9Aadhgq685N
>>"%B64%" echo n6wRi0EiZrbj+r3d+LQh1kFp2Ydt7xuNNJr+py34eHqjn0I4+bd6hc8j/cb6S7+x
>>"%B64%" echo HrD0X1BLAwQUAAAACACweXFd/s40jNIBAABWAwAAIgAAAGphcnZpc19hdG1vc3Bo
>>"%B64%" echo ZXJlL2pvYnMvc2NoZWR1bGUucHmFUk1v1DAQvedXDJEqJWoawTUi3Iq4wKniGpnE
>>"%B64%" echo YS0lduQ4wAqQaEHqEbiXc6+rlqVV1d3+hfE/YpyPzR6QsBTH8+bNeGaefd/HH3hl
>>"%B64%" echo z3CLN7jCB/vVnuId4ANugfAvuMZ7+jZ4mwBZK3tqz+1PewY9/TeuCfyDd3gLZFDI
>>"%B64%" echo htAbt9vzPmxDia/JQSbF4ir2fd/zSq1qyLKyM53mWQaibpQ2wKRUhhmhZDtyCma4
>>"%B64%" echo ETWfGJMdgdsLXhnmeV7BSxBt9o5VosicI1gs6jqB1ugQjp7BG6WqxANaRi+Hg1tT
>>"%B64%" echo sph4zS4sAv/gRXLw0g97Iv+Q88ZA8JpVHT/WWukITpbNcAznZJpTLxKes6rl3h5w
>>"%B64%" echo ojs+ltjyXMmizTppRDWXGIFU75O51U/wSkkOaf/r6y8rxcxwlSiJbf7R7X4pTLQc
>>"%B64%" echo 5oKD0sdfpMZVr5ZTZL3T1n5P4KOLf6Q/Q2C/4Zbwe9KKFL7EywQv8CIcR2GYfssN
>>"%B64%" echo Ffa/wcU9NgRRbxThdqXnQLJHf85kIRw+sGLNm4rlPNh1s1CdToerY3eOoBayM3zC
>>"%B64%" echo Bisap5s+dv5cq8ns84TT7ObbnvbXzUObPYfp/LiCgi3b9Em4r2gwU49cDmqXXm2V
>>"%B64%" echo jfJSX38BUEsDBBQAAAAIALB5cV3WaKOb5ggAAP8YAAAiAAAAamFydmlzX2F0bW9z
>>"%B64%" echo cGhlcmUvam9icy9fX21haW5fXy5wea1ZW2/byBV+16+Y8iUUKrNJC/RBgAosFvtQ
>>"%B64%" echo FL0ALfriNQjaGsncUCTBSxzDFWA7TdMii7gF9qnY3WKLAvsqu1HitWPnL5B/ob+k
>>"%B64%" echo 3zkzw5ske4NWgCORM3POmXP5vjMTy7KKfxa35YviqliI4qJ8XtwWr+nnO/pRPiuu
>>"%B64%" echo yzNRvC0WNAHft8XFUMSH2X4Uiq2Z+MxLnvip62WzKI33ZSKdz6LdVGxj3vvyT8Vl
>>"%B64%" echo cbljWVavN0mimXDdSZ7liXRd4c/iKMmEF4ZR5mV+FKa9nnmXTGMvSaV5nsos9tLU
>>"%B64%" echo PKaH1c/Mn0nhpfztzqJxHkityRkn3iRLRSUilImXSZdfD0TqPdG/9fTH8jDNokSa
>>"%B64%" echo Bb/Qz58kSZQMxK4fjl1vby/KwyzVy8mmgygZawmzKPSxwgj4pXrUg+neviTrzGgq
>>"%B64%" echo 96JwnLoQ5wdmjswyP5xWNn+k1A3Eb/WAmRflyZ6spv06Gcuk1+uN5UREoRvKAzei
>>"%B64%" echo Vzb/O1TjMFkLGVbi+mLrZ+JXUSiHPYEPe0OMOq5SUurlfZ4be9k+ptZeNNP4Qc3Z
>>"%B64%" echo zccIHGZNrIEozstXyKo3xbI8FUc82VEThtO5KI+RZueOJXxsoTEmZJBKgexhnYkf
>>"%B64%" echo ZvbEKr6iFCxfFt81snIotrVU5Z35jtGS+Vkg50dK4Nzqt2QJMytPgtWx4luYe1zc
>>"%B64%" echo kD4k8tVQHNHG55+GmKoc7iaSguBSfsA99r1eniBD7DjwMvyYDUQQTf2wPxCooF0E
>>"%B64%" echo eyz8sJ1rlUTHvOk7fiZnqd1XAumTooIkPG0V74sFLL5FzX4uUH/HMPuiPGM/3bB7
>>"%B64%" echo K0XKte0FN8VS+fQ1z6/kV67/K7wNfyNaNxRHs4+5sI94J/M+fMTWzJ3KR0keulG4
>>"%B64%" echo Jzc5B7LVVjY5U8XF1NfIlFZnvEp81Kekqk0xVS9y4igI7H4VAZ5Hvq4X1d5cLaJu
>>"%B64%" echo +pOImUxTbypJiNI2XHXX1+WfEYBzhayX5Ul5ykB7Q8lULOAqLWSOCpn4gRwB2pw0
>>"%B64%" echo g8ZEKULAAI9rrVRKqmoonyPeDNiM3+VZ+RdofN4Bbg5xeeroVE8kwDgUDxuB8vIs
>>"%B64%" echo +h8DBaPrpIU4FwmByYTRtfkHnk/Y0MJBe9OyfmfX1SMHg9LyglzLe31fPitPiiv2
>>"%B64%" echo BoAFyXqCn3A+pTS+X4HjkKMbNM2F1RFuI2CEAsvirThiq38kfvLThw+HzqMJkOuF
>>"%B64%" echo 03fEx1kS/PBj8Z/jLwQCfArmXELXwqll1TtoUJWTBlLGNgn9fine2X298y028A3y
>>"%B64%" echo 6t1QMPOipssTwZF/g3R4icquN03V4EKUTJ54gTvzwzyT6ZwY/7K4cQYNH0BFN28v
>>"%B64%" echo kbcPBuIBeN4P65BpVurPu+6g1QsNoleVU1r5XQkBCxOjrknzvwOhXlEoGPqXAvG8
>>"%B64%" echo ZpGLLmyVL5Xmc6AU2hfgFBcG1wCWYkV5Wn4Os86o2zkxa/U4wxYp1nTKtW3rOh0C
>>"%B64%" echo aZMOoP//Cp7FZclhLdegV1WYrdwMvNnu2BOa5u9ErUFrodnWyPwYdPJUPt2TMfdA
>>"%B64%" echo u5GXjH9OmZLkcbYSlk/DNRnYDfo1VcMGyPHDOM/cwE8zO0ZzAxXk4oHYy5NEAm4E
>>"%B64%" echo DW3j1Q67vXpSlqT70UFIvIeUVemo1/Ups/TviukIGMhUlYCJd4CVrB+RO1La52gj
>>"%B64%" echo WOh8ZyisPkKT+LHdylWsq92gd6M1NTe4TSRt1jNh0AtiCwhw0jjw4b6BxYY2p+60
>>"%B64%" echo HDMJIm+TZ3hM/IFTkZ3TfNH2j/FEwyl+yruhucZBTA0f7hwHZBB4oHdsh+JgfZC7
>>"%B64%" echo Wvmux9WusbKVjb/3gly14ytpiFbtK8KEF4zzwAWFAG8JhBkzqACXGigu8V4BNP3d
>>"%B64%" echo GnvX2Fezoikku82DVcc+qojSge1juwnXRNELyjzus74jBBXFFygVarwuFDM5oviH
>>"%B64%" echo acQwXD4n4gKUnWGVAioCPAUoS1hPhfWumoYtYRUIH7v7uvjG4f60aZ9z4AWBzFxv
>>"%B64%" echo PE4AQDC3RhITZBTya6phxRq3ALIlNYUMZdtHmyQhrx/UlfVgTdkw4CSbTGlwwQoJ
>>"%B64%" echo mAxU8HAnBTQ4WjcB5Lln5StrsCq3oy597AfBijLEjNVQtL6XdCWmI1udOohhK/kq
>>"%B64%" echo ua3iS+JagksIJD/fqBNN45zUlF4L2qDBe7pGA1iN0uYDdXhP+ysgsKbnWO228P6Y
>>"%B64%" echo 05MLjo5P3w5hxZfN/On0WyqBlKOvVfqolOhCbwtH1p+pcbRBO+OPWXCvTvBJe4SB
>>"%B64%" echo pZbV8mbXuhHpraYSTrYXtvAHmcjHRXZy+UfU0DF5Hg0IodFqK3oXIrGWg320COJ3
>>"%B64%" echo Sd7QujYo9LGAKbdoPRaMKad0nFu0Tms2dF9z81OZNuAC+jdlYl8oFBGfENkj5TnE
>>"%B64%" echo 52imdHd0CyEvlORho0FcLfZ1wE+f3UR6j2vkho+p6LbjFknGKww5EI9Aig3hgQxt
>>"%B64%" echo Xt0XPxiJH1MGkT7Ain69KUT/qiMyFHc6o0EJ9MERBemRy+qlPorDfH1HU53oR2zC
>>"%B64%" echo 9sMdfbTXz492aokrB3rHi2MZjm393Djs6AsmvpThKzBHf3dPQKLBHxT513xpd6Ql
>>"%B64%" echo Oo1zugov0yMfEirw5sj2W6Ftet3Y0nZui72rDTYvx+yuDQPjPYcdNKgk91cE1aFr
>>"%B64%" echo bg7lc1sR5N+Km7XkuFxDjk4nrHWXW9/00WUi3q9uqnFjhPG5KVFzEVaxAPbeYv8J
>>"%B64%" echo 9cjf1BarEjc3Seub4pmHTrbdafB9KB0Mzd2o81EyzWfoUn7DI9QjTkfW+stYy5wu
>>"%B64%" echo x5JKTslywMDuLM9yFM6hiz0FeeojcNMkyk058wqe6GlttrW1RXc5FoWRbm1HFjvP
>>"%B64%" echo zYBSeLkvg3hk8Q3yJYWmcRTtHofA3NZdagiL71Gz0EzENQ0FxNMnRNkEwNV55E4t
>>"%B64%" echo JnL3aLpZbeGQdacM+HxqJoYtlneqmub+vW67ouwQLXVLotdLdR1PFxinDFgLrQoK
>>"%B64%" echo GjHlL1KKTrVnqJMeHSjv8ideGeqkHhePNWnqjNTvjbB7+l2jq7o+WieubqVbayja
>>"%B64%" echo a+e3LqRa5bJyr0gXjpDnuqE3o/9iGOFk6LpUTa5r6Y4d5235FMyiaqzf+y9QSwME
>>"%B64%" echo FAAAAAgAsHlxXX2agzLXAgAAIAcAABUAAAB0ZXN0cy90ZXN0X2ludGVudHMucHm1
>>"%B64%" echo VFtuGjEU/Z9VuP4CCSH19RMpalfQDUTRaAQGpgEb2aYk/YLQlkiJmp+uoCuYJkzC
>>"%B64%" echo K2QL9o56rz0UGB7tT5FgsH2O773nnjuUUvPTpLZvL+01sT2T2L55NgvzaJ5MYu7g
>>"%B64%" echo +2TG9pa45RyQPZPilpmUKaVBELfaQmrSvtBM6SCoSdEiHyP5KVZhpFtCtRtMsnLM
>>"%B64%" echo NeNakQxdZZpVdOh3gyB47+nlViTPyu1IRi2mZfyZFQICH9puyEixEodtWnJbJ+4X
>>"%B64%" echo PwVqniGnMaSa2ssSMT/MAxTRg/XY9mmJ0LpkTMe8ToulddYGDnhTs7CX8O3ZazMh
>>"%B64%" echo dohKvEO+jiHsBhckArSZ2Rt8EnPnRJnb291wACWOkBJgpuYe/o7ME4gKUSC4mZkF
>>"%B64%" echo MquRzjPvgDez3xFHIMDAPEJ2UztAeKuj4kooeJ6CiL+RarWtikaQ2QwSnWCSTkxY
>>"%B64%" echo piZFVjOuN3TYaedCeeHvIdjAXkGwJXFFqYpuPj8vRoKWQp95MRKkdFmkwS278GSZ
>>"%B64%" echo HuKUjnRH5QoYYvOId/EAjQqJXNkbxDdYM585tvoXRJ7gOTuP9eY5MJois/F+C3Ub
>>"%B64%" echo kSbYbhKDs3W++aeloBhUWY2gtUNveZV5XhUyTxM0dfHIEfwROd4cjwxZdJBIKQbz
>>"%B64%" echo kyEhLBeafBCcbZ+W8WZyfOwi/POMqabQu2Zs3YjO7Q/Q+TmxX0BEsJaftJqobPVl
>>"%B64%" echo hYW3xgLa5FrC0R25niTQkzlA+nApvmYSHwg9OfX3S9aMzg9MCFC/4dvJDogz4tDd
>>"%B64%" echo M4bAU+8cKFtf7E0QY6Ir0ERb5ezupqowzsJurBshKvenq7j4v12lLjTdgcDYiMDn
>>"%B64%" echo ob5nLYdKTyiWiy6AB2rglMDBGy1XePLy1es3b+npmgwdfsZhwkN/UyiZ7kiuQg6p
>>"%B64%" echo Lws8Ws9wpwRYsCs2WF280lV0lqszdtEVshrGGCDbLBwW2Q/6yF7br3SP1BiZCLkh
>>"%B64%" echo 74uVvL8BUEsDBBQAAAAIALB5cV2tyL5TswEAANgDAAASAAAAdGVzdHMvdGVzdF9t
>>"%B64%" echo YWluLnB5nVO9btswEN71FAQnGwiMZC3goUufoDvBWheLtUQKJNU2m+0UTYEUWTt1
>>"%B64%" echo yRM4btyqcZu+wvGNelTkRM4PEFeABh1P38/dR845nuMqzMI8nLLwCWu8wjUuGF7j
>>"%B64%" echo RZjiAi/wOsypWLPwsSn8HHDOk+TQmoK9lfadckL6wrgyAwtMFaWxnsmRV0a7J7oG
>>"%B64%" echo QhRSaSE27ZnUaQ6izKx0kCRJCoeskBPo9V8kjB4LvrJ6gzp4eYvU67fdHpwXYwvg
>>"%B64%" echo lR6L1IAT2ngBH5S/Aynzoz3mMlPlaXPChtvMPY5/yWONSxrJnOEl/sAFFZZYhxnf
>>"%B64%" echo ayX1GzTpHJDyLppy7JXMyUDnvCHtaoydwqmxpk7hssqn5r3eSWLcB20Ffz1L0Wtb
>>"%B64%" echo bQni+JWWGA1Ow2dyd8aZ0g9lVnqiSVjLKuK5opm+qbyYAJRO2EprGvVOyhdtpq7o
>>"%B64%" echo vdx8/d9cOX7DFYv/U3ZnuA6n0Q2uH3fjRqBByDKaSIXRo9tkdaI7bHU09fvSl/Fe
>>"%B64%" echo hLNwEi/CFFeUjBp/M/xD6zgJX8jEHdKWkU7qczXOaCxDtj84eJTkJnzfieiY3BDR
>>"%B64%" echo 7CaJu6LvJ/8AUEsDBBQAAAAIALB5cV0rEiSzTwIAAIAHAAAVAAAAdGVzdHMvdGVz
>>"%B64%" echo dF9hY3Rpb25zLnB5pVXBjtMwEL3nKyxLSKlYovTAAaQeuCBx526ZxGldEieynWV7
>>"%B64%" echo 266QFqmIHjkhAV+wWih02W2/wf4jHKdZ3G2zJdCbnfGb92bmTSGE6qta6Kk+0zOg
>>"%B64%" echo vquFuqoO6lIt1RVQS6Cnam1v1nquVmqp50BdmOONvX5r3p7qWQAh9LyE5xkYY35M
>>"%B64%" echo BcIyy0UxIpwAmhU5lwBHkuZMtEQFlEnCpGiiX9ij53kxSYAkQiIREUZQNMJsSAQS
>>"%B64%" echo Ekvi9556wPycZIMmT/Ds9tLv2ShOinTiBJATEpUGpE7lQ5sAHgHI6HAkYe/Iwa0R
>>"%B64%" echo sBDEcIPqkxF/rt9DQFkN6352RFlIMBg0mC1hWSlohHIGqADPcSpIS1xagVRwYdDf
>>"%B64%" echo LU2BuZwgwvCr1BTIYnYr0MHC2Az3FKZF0ktetik6ztMyI7WkJ66kkr1m+Ru2kcbJ
>>"%B64%" echo mESSxP/Y8D/5cGGualAfql/VDNeTDHc6vDAO+Gl8YM2hVnpm/KBPzfUP8+GmQ+uT
>>"%B64%" echo PCoFdMXZPqIoxVnRVdPuNIB+EG5x74fhA0vP1R2Pyyax/zAMHreihXfQDmA9sliO
>>"%B64%" echo trrxMh8O047+bBu/ZpT+Z/Duh06S7ti1Tx3hkmYEYRaj2GwmVI0GJeK2As1cfbEb
>>"%B64%" echo 9tys0Gld1w2zqOTcULIofm/3zTe1Ntt5ped7X8V2GW6tBLMfS4GSnGdYduxDk/fz
>>"%B64%" echo 1rC7s23B75KsrHLWErrH2fXCt4WaNAQPrejNW9utPfR3PVw51pTauPxaz/Q7daGu
>>"%B64%" echo Hec6rMgJ7cilevGXRD6avJf2n9Iw0B8cBr8BUEsDBBQAAAAIALB5cV2iE4WF9wcA
>>"%B64%" echo ANEXAAASAAAAdGVzdHMvdGVzdF9qb2JzLnB5nVjbbuPGGb7XUwx4RS241MHYNBZE
>>"%B64%" echo BblIb9o0QRwEAQyBGIkjm2ueMDOy1ygW2DgXvWjRoEBvCzR5Am8adzdJvX0F6hX6
>>"%B64%" echo JP3/OVBD6xA5BmRRnP/4/Yf5ZzzPq7+r71ZfrW5Wfyb1f+p39Q+rr+ufV9+Q+k19
>>"%B64%" echo W/8Enzfw8vsRqe/rW0X3Cn7/CCtvA/LZyUmgue7rt6ub+t3qVUBWfwKBr+ANsNVv
>>"%B64%" echo NSH8Bub6v0D1FYgE6vou9Dyv00nzquSSPBdl0VnwMicJlUymOSNmxf5uSKtryYTs
>>"%B64%" echo aOrnlF+mIqYyL0V1zjgLn5cz0fByupAiIBfsWsiSs4DkZZHCU0DE/JwlywxeiXLJ
>>"%B64%" echo 50zskxcKJmVanDWCP5zPy2UhA3JiFjqdkw8//vT3H8UACYkIuDb+4EWekUvGRVoW
>>"%B64%" echo kTcI+x5hxbxMgDzylnLx9H3vg0lnzIVYUw2BajKen9OiYBksppLlkw4hY5nKjE3q
>>"%B64%" echo f2I8EMz6NYB9g/Eh5vFWRYh8ei3Py2Lc0wzImqXFxeRcykqMej32guZVxsJ5mfdK
>>"%B64%" echo njDeG4x7igJJEybmPK0k2DKp/wGJ8O/6rr43GkJS/2311/oHfLm6Ic/6/T7EFYhe
>>"%B64%" echo h+Oey4mSzpZpMlEKnoIC9asz7ml3Nrz6O6QDZtuPqOtnVAla3sL/f9W3j/BkuMuT
>>"%B64%" echo bzFnIS0hJSFdXztODPu7vWjM7dl4jHsQrIlK207CFiSnFyy2qeE/eVJCHHkKQrrk
>>"%B64%" echo 6aRJjRHYQ0iTQVGz4JvMi/7oLbKQL70R8bZ5B4uQSt7LrhK0KDnmc0AuabaEKilI
>>"%B64%" echo ozZEg4Xf1RqNViol9632wGHV4jiTS1405rmeKVQ33DJGh5/gqtYEHHSZSfQtSefS
>>"%B64%" echo X6tXtJFxL2jeK8lxmkSeSRFnTYU78g5OdYd1ybNoK4Im0x1SJ9Kg6xGp7siYLZMz
>>"%B64%" echo JiNcDfv6dbeFR7issHv5awBbkLtAAsyWq2tigF2uya6YQ79JJJjsy7yKKyrPTZjx
>>"%B64%" echo EYC3b0mPeJYpxK7q7Uy/xpErmmVMxjRJOBMi8j7/7MvB8MjxlOp2J6JT0/j8KqMS
>>"%B64%" echo MjFvYkuy8iwFLNNLWnjd6ZoXEu4K8AdeT4MLtF6lQ+eQiYs0y5DIRpV4NC3POM1d
>>"%B64%" echo Kg15nIOmAcC+uUBfqHg4K3Qpy1hIymWM20jk9Y9HR33PjVeDl6CXzFfYqvdZSROW
>>"%B64%" echo OJCF+MYhoEIw2A00XdiGkUSwDRgktxBbSJHsYFS3yLHwKjlbEN6muo2IMlSDsjXz
>>"%B64%" echo FmnG4nMq4qKEDBMC1cFLliW/LhXbXfNh7n3pdR+GwVjvWeUeKUqJjQ9lqpAIRR1y
>>"%B64%" echo RpNYshfSf7jRdrcXVZ4KAQ/aRV2WIrZ1+NC7HdngektnghVS+3pghmzLjarMsjgt
>>"%B64%" echo JOPQqDHZl2A2Uh/1XTcqygWYLZqOr9oclrhtLWuK9XQCuaGTq20gK3zN3kVFQ3dN
>>"%B64%" echo vz/tT0PVm5XZh7fn7ZJ0vaIo3T63UA2mod0nlMo9G7+3CYtpCJeUpxTKzEJkVLQB
>>"%B64%" echo 0rS+N+gTt9MrJLDNPLBvBzN68r+be8P27DAugOyuftMaSupbEJEK8oeyYK5fZnTF
>>"%B64%" echo ZIXMEPHsOjbFH9MisRK7G+NGu9422/E02GirbjtVAOhcAQtQnrYj/Fh/N7NFK5+A
>>"%B64%" echo KMyphCFb+M4w0W0RYRnvILRTgDMaQldr79qtSdE7WLTZto/xL+y3O4PFGKpwWWXp
>>"%B64%" echo HHZvodDlDOd+EcNGXnKxRpm5iOSMnyHUUEunrtNTM7kxtCUZqSHpVEg4hWSpgCd3
>>"%B64%" echo EJhOQeB6IGzLebknDO0wdwOjjkcZzWcJxeEIzjoja8WpgLijqVBeIsIHbWTBrrQ6
>>"%B64%" echo mBW1s1qXakp+G+OGVG0+044dfsiMlxcAglapvHNmUk5TwZpyOFHfH6Em34PDIRTA
>>"%B64%" echo 6i/YQO4gsu/UgfNrODfeY1V0rPvDx/ivjdnv3fAQ95w1y4t77n6jp9vSiy+LWO3C
>>"%B64%" echo c9gQhPo/o/OLjT7ein7gTuUPJ+ihnQ7gCMAp6ABufPRPrbun0+m+Km7Cc2geFbjP
>>"%B64%" echo Wm1dZ5ribM7SS7VTGtBExlgl1r8xnSwEviUPaVWxIgmMB1DiIhoGmjfSEgzJxsZl
>>"%B64%" echo RWxuXVYzqB683++3gnHGClTEYnVLEC8FlHrFS5wFfrGLPnJs/bXzs/YUJxo8WqnL
>>"%B64%" echo jLBttt/OkK29+BGbNU5VqK7FrtcCYh3bSqTs3rqCG/x6xQmAxh2HPZjaSjWE7Zgo
>>"%B64%" echo jetIutVtDxy5q3/Cwtu8froFcBuxSuq8hNmqQEx/aWxsObJfCXpoBLe49p1HXR4H
>>"%B64%" echo GHtd5Rz6oGTgbYW7mYFmnoEG8lvA4XfsmoPRzqkfmXEbedlxDrwLzI5mgodtO1tg
>>"%B64%" echo wvDLdM7MvYBddLq1LoNsESqhp77L0J0qCDVPW9XZflUPFDSXEFZPiKNMW5fp/gtw
>>"%B64%" echo GLQ6fvtNW7MI4XUdXoX4cazv6+LY98S1gKNFXuKlH7RD70JzQ3KgSC3DAq8zrbG/
>>"%B64%" echo qVGd5QEea+Zgczs/Gmac4ncyqx5l+RX7DIMMLjX8sxQGDtsy/INbRssYIxRyYMOA
>>"%B64%" echo EfmcL9nLR5leStgBto+l9iLV9syivMKKNbe2/rA/fC8ggwF8fgMfmC37LUMtO8QM
>>"%B64%" echo KiERMbiaZjBOD0bQNgIUpyA7em9joN7BCUfZFufwiDzZx54KOCVkaaIOw745CW8M
>>"%B64%" echo k7vIh89Q28Hkapj9Xt2i3xquqxR6nL7UDtVsJPwv8H5OzUTuXd4Of4+PR8fHxt/O
>>"%B64%" echo /wFQSwECFAMUAAAACACweXFdkFOFC48DAADtBwAACwAAAAAAAAAAAAAApIEAAAAA
>>"%B64%" echo aW5zdGFsbC5iYXRQSwECFAMUAAAACACweXFdY9uce3wBAAArAgAAEAAAAAAAAAAA
>>"%B64%" echo AAAApIG4AwAAcmVxdWlyZW1lbnRzLnR4dFBLAQIUAxQAAAAIALB5cV1/yxxb7gEA
>>"%B64%" echo ADEDAAAKAAAAAAAAAAAAAADtgWIFAABpbnN0YWxsLnNoUEsBAhQDFAAAAAgAsHlx
>>"%B64%" echo XbmKBQ86AAAARAAAAAoAAAAAAAAAAAAAAKSBeAcAAC5naXRpZ25vcmVQSwECFAMU
>>"%B64%" echo AAAACACweXFdBMK/VJAAAADtAAAADgAAAAAAAAAAAAAApIHaBwAAamFydmlzX2d1
>>"%B64%" echo aS5iYXRQSwECFAMUAAAACACweXFdlTWO160HAAACEwAACQAAAAAAAAAAAAAApIGW
>>"%B64%" echo CAAAUkVBRE1FLm1kUEsBAhQDFAAAAAgAsHlxXacHEAhmAAAAagAAAB0AAAAAAAAA
>>"%B64%" echo AAAAAKSBahAAAGphcnZpc19hdG1vc3BoZXJlL19faW5pdF9fLnB5UEsBAhQDFAAA
>>"%B64%" echo AAgAsHlxXZ2ex9RcAQAA/wIAABsAAAAAAAAAAAAAAKSBCxEAAGphcnZpc19hdG1v
>>"%B64%" echo c3BoZXJlL2NvbmZpZy5weVBLAQIUAxQAAAAIALB5cV3x8j8TeQYAAKIRAAAcAAAA
>>"%B64%" echo AAAAAAAAAACkgaASAABqYXJ2aXNfYXRtb3NwaGVyZS9hY3Rpb25zLnB5UEsBAhQD
>>"%B64%" echo FAAAAAgAsHlxXXqnssDfAwAALQkAABwAAAAAAAAAAAAAAKSBUxkAAGphcnZpc19h
>>"%B64%" echo dG1vc3BoZXJlL2ludGVudHMucHlQSwECFAMUAAAACACweXFdHMLlrdwDAABuCgAA
>>"%B64%" echo HQAAAAAAAAAAAAAApIFsHQAAamFydmlzX2F0bW9zcGhlcmUvX19tYWluX18ucHlQ
>>"%B64%" echo SwECFAMUAAAACACweXFd2X+Mr2kCAABVBQAAIQAAAAAAAAAAAAAApIGDIQAAamFy
>>"%B64%" echo dmlzX2F0bW9zcGhlcmUvc3BlZWNoX2lucHV0LnB5UEsBAhQDFAAAAAgAsHlxXaID
>>"%B64%" echo pVRWAQAAPAIAACIAAAAAAAAAAAAAAKSBKyQAAGphcnZpc19hdG1vc3BoZXJlL3Nw
>>"%B64%" echo ZWVjaF9vdXRwdXQucHlQSwECFAMUAAAACACweXFd4CWwR2EAAAB0AAAAIgAAAAAA
>>"%B64%" echo AAAAAAAApIHBJQAAamFydmlzX2F0bW9zcGhlcmUvam9icy9fX2luaXRfXy5weVBL
>>"%B64%" echo AQIUAxQAAAAIALB5cV2pi5haIgMAAGIHAAAiAAAAAAAAAAAAAACkgWImAABqYXJ2
>>"%B64%" echo aXNfYXRtb3NwaGVyZS9qb2JzL2tleXN0b3JlLnB5UEsBAhQDFAAAAAgAsHlxXUs1
>>"%B64%" echo xPXPAwAA7gcAACIAAAAAAAAAAAAAAKSBxCkAAGphcnZpc19hdG1vc3BoZXJlL2pv
>>"%B64%" echo YnMvc2V0dGluZ3MucHlQSwECFAMUAAAACACweXFdVvbK5psMAACbMAAAHQAAAAAA
>>"%B64%" echo AAAAAAAApIHTLQAAamFydmlzX2F0bW9zcGhlcmUvam9icy9ndWkucHlQSwECFAMU
>>"%B64%" echo AAAACACweXFdKA9sIKADAABbCgAAIQAAAAAAAAAAAAAApIGpOgAAamFydmlzX2F0
>>"%B64%" echo bW9zcGhlcmUvam9icy9tb25pdG9yLnB5UEsBAhQDFAAAAAgAsHlxXeR6RCrcAwAA
>>"%B64%" echo +QcAACAAAAAAAAAAAAAAAKSBiD4AAGphcnZpc19hdG1vc3BoZXJlL2pvYnMvZHJh
>>"%B64%" echo ZnRzLnB5UEsBAhQDFAAAAAgAsHlxXWvGC2QzBAAAkAkAACEAAAAAAAAAAAAAAKSB
>>"%B64%" echo okIAAGphcnZpc19hdG1vc3BoZXJlL2pvYnMvc291cmNlcy5weVBLAQIUAxQAAAAI
>>"%B64%" echo ALB5cV3+zjSM0gEAAFYDAAAiAAAAAAAAAAAAAACkgRRHAABqYXJ2aXNfYXRtb3Nw
>>"%B64%" echo aGVyZS9qb2JzL3NjaGVkdWxlLnB5UEsBAhQDFAAAAAgAsHlxXdZoo5vmCAAA/xgA
>>"%B64%" echo ACIAAAAAAAAAAAAAAKSBJkkAAGphcnZpc19hdG1vc3BoZXJlL2pvYnMvX19tYWlu
>>"%B64%" echo X18ucHlQSwECFAMUAAAACACweXFdfZqDMtcCAAAgBwAAFQAAAAAAAAAAAAAApIFM
>>"%B64%" echo UgAAdGVzdHMvdGVzdF9pbnRlbnRzLnB5UEsBAhQDFAAAAAgAsHlxXa3IvlOzAQAA
>>"%B64%" echo 2AMAABIAAAAAAAAAAAAAAKSBVlUAAHRlc3RzL3Rlc3RfbWFpbi5weVBLAQIUAxQA
>>"%B64%" echo AAAIALB5cV0rEiSzTwIAAIAHAAAVAAAAAAAAAAAAAACkgTlXAAB0ZXN0cy90ZXN0
>>"%B64%" echo X2FjdGlvbnMucHlQSwECFAMUAAAACACweXFdohOFhfcHAADRFwAAEgAAAAAAAAAA
>>"%B64%" echo AAAApIG7WQAAdGVzdHMvdGVzdF9qb2JzLnB5UEsFBgAAAAAaABoAOQcAAOJhAAAA
>>"%B64%" echo AA==
certutil -f -decode "%B64%" "%ZIP%" >nul
if errorlevel 1 goto decodefail

powershell -NoProfile -Command "Expand-Archive -LiteralPath '%ZIP%' -DestinationPath '%WORK%' -Force"
if errorlevel 1 goto unzipfail

if not exist "%WORK%\requirements.txt" goto unzipfail

cd /d "%WORK%"
echo [2/4] Creating virtual environment...
python -m venv .venv
call ".venv\Scripts\activate.bat"
echo [3/4] Installing dependencies (may take a few minutes)...
python -m pip install --upgrade pip
pip install -r requirements.txt
if errorlevel 1 goto pipfail
echo Checking microphone support (optional, errors here are OK)...
pip install PyAudio
if errorlevel 1 goto nomicaudio
goto shortcut

:nomicaudio
echo.
echo NOTE: microphone module (PyAudio) was not installed for this
echo Python version. Everything else works. For voice input,
echo install Python 3.12 from python.org and run this installer again.

:shortcut
echo [4/4] Creating desktop shortcut...
powershell -NoProfile -Command "$d=[Environment]::GetFolderPath('Desktop');$s=(New-Object -ComObject WScript.Shell).CreateShortcut((Join-Path $d 'Jarvis Atmosphere.lnk'));$s.TargetPath='%WORK%\jarvis_gui.bat';$s.WorkingDirectory='%WORK%';$s.Description='Jarvis Atmosphere';$s.Save()"

echo.
echo === Done! Shortcut "Jarvis Atmosphere" created on your Desktop ===
echo Program folder: %WORK%
echo.
pause
exit /b 0

:pipfail
echo ERROR: Failed to install core dependencies. Check internet.
pause
exit /b 1

:nopython
echo ERROR: Python not found.
echo Install Python from https://www.python.org/downloads/
echo and CHECK the box "Add Python to PATH" during setup,
echo then run this file again.
pause
exit /b 1

:decodefail
echo ERROR: Failed to decode embedded payload.
echo The file is probably damaged - download it again.
pause
exit /b 1

:unzipfail
echo ERROR: Failed to unpack program files.
echo The file is probably damaged - download it again.
pause
exit /b 1
