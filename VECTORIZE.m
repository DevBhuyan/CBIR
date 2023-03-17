    % ret = 25:5:70
    % prec_fin = [prec_tot(25), prec_tot(30), prec_tot(35), prec_tot(40), prec_tot(45), prec_tot(50), prec_tot(55), prec_tot(60), prec_tot(65), prec_tot(70)]
    % rec_fin = [rec_tot(25), rec_tot(30), rec_tot(35), rec_tot(40), rec_tot(45), rec_tot(50), rec_tot(55), rec_tot(60), rec_tot(65), rec_tot(70)]

%     ret = 1:10
%     prec_fin = prec_tot(1:10)
%     rec_fin = rec_tot(1:10)

%     ret = 25:5:70
%     prec_fin = prec_tot(25:5:70)
%     rec_fin = rec_tot(25:5:70)

ret = 1:10;

p = [1	0.97625	0.92833	0.87437	0.8215	0.76208	0.71143	0.66781	0.62528	0.58475]
r = [0.1	0.19525	0.2785	0.34975	0.41075	0.45725	0.498	0.53425	0.56275	0.58475]

pl = [0.7072	0.61676	0.54295	0.48598	0.43943	0.40088	0.36869	0.34133	0.31791	0.29763]
rl = [0.7072	0.74011	0.76013	0.77757	0.79097	0.80176	0.81111	0.81919	0.82656	0.83337]

pc = [0.54424	0.48218	0.43176	0.39135	0.3579	0.32993	0.30578	0.28558	0.26783	0.2523]
rc = [0.54424	0.57861	0.60446	0.62616	0.64421	0.65986	0.67271	0.6854	0.69636	0.70643]

    subplot(121)
    plot(ret, p.*100, 'b*-')
    hold on
    plot(ret, pl, 'r*-')
    plot(ret, pc, 'g*-')
    title('precision graph')
    xlabel('no. of imgs retrieved')
    ylabel('precision')
    grid on
    hold off
    legend({'CSLBCoP'},'Location','northeast')

    subplot(122)
    plot(ret, r.*100, 'b*-')
    hold on
    plot(ret, rl, 'r*-')
    plot(ret, rc, 'g*-')
    title('recall graph')
    xlabel('no. of imgs retrieved')
    ylabel('recall')
    grid on
    hold off
    legend({'CSLBCoP'},'Location','northwest')